import 'dart:io';
import 'dart:math';

// import 'package:better_open_file/better_open_file.dart';
import 'package:camera/camera.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../common/theme.dart';
import '../../ulib/tools.dart';
import '../../widgets/index.dart';
import '../mark_page/index.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<String> _paperList;
  late List<XFile> _imageFiles;
  late ScrollController _scrollController;
  late int calendarLength;

  @override
  void initState() {
    super.initState();

    _paperList = ['模拟考试一', '模拟考试二'];
    _imageFiles = [];
    _scrollController = ScrollController();
    calendarLength = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(children: [
          _renderCamera(),
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: _renderCameraScreenNavBar(),
          ),
        ]),
      ),
    );
  }

  _renderCamera() {
    return SafeArea(
        top: false,
        child: CameraAwesomeBuilder.custom(
          builder: (cameraState, preview) {
            return cameraState.when(
              onPreparingCamera: (state) =>
                  const Center(child: CircularProgressIndicator()),
              onPhotoMode: (state) => _renderTakePhotoUI(state),
            );
          },
          saveConfig: SaveConfig.photo(),
        ));
  }

  _renderCameraScreenNavBar() {
    return SailingNavbar(
        backgroundColor: transparentColor,
        titleWidget: SailingPicker(list: _paperList, defaultIndex: 0),
        leftBarItems: [
          TDNavBarItem(
              icon: TDIcons.close,
              iconSize: iconSize,
              iconColor: TDTheme.of(context).whiteColor1,
              action: () {
                Navigator.pop(context);
              }),
        ],
        rightBarItems: [
          TDNavBarItem(
            icon: TDIcons.chevron_down_rectangle,
            iconSize: iconSize,
            iconColor: TDTheme.of(context).whiteColor1,
            action: _markPaper,
          )
        ]);
  }

  _renderTakePhotoUI(PhotoCameraState state) {
    return Column(
      children: [
        const Spacer(),
        Column(
          children: [
            SailingCameraButton(onTap: () => _takePicture(state)),
            StreamBuilder(
              stream: state.captureState$,
              builder: (_, snapshot) {
                return _renderCalendar(snapshot);
              },
            ),
          ],
        ),
      ],
    );
  }

  _renderCalendar(AsyncSnapshot<MediaCapture?> snapshot) {
    return SafeArea(
        child: SailingSizedContainer(
            height: heightSmallItem + spacingTight * 2,
            color: blackColor,
            child: SailingPaddingEvenTight(
                child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: calendarLength,
                    itemBuilder: (BuildContext context, int index) =>
                        _renderCalendarItemLayout(index)))));
  }

  _renderCaptureLoading() {
    return SailingSizedContainer(
        width: widthSmallItem,
        height: heightSmallItem,
        color: blackColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Platform.isIOS
                ? const CupertinoActivityIndicator(color: Colors.white)
                : const CircularProgressIndicator(color: Colors.white),
          ),
        ));

    ;
  }

  _renderCalendarItemLayout(int index) {
    bool isLoading = (index > _imageFiles.length - 1);
    if (isLoading) {
      return index == 0
          ? _renderCaptureLoading()
          : SailingPaddingLeftTight(child: _renderCaptureLoading());
    }

    return index == 0
        ? _renderCalendarItem(index)
        : SailingPaddingLeftTight(
            child: _renderCalendarItem(
            index,
          ));
  }

  _renderCalendarItem(int index) {
    return SailingSizedContainer(
        width: widthSmallItem,
        height: heightSmallItem,
        color: blackColor,
        child: GestureDetector(
          onTap: () {
            _viewImages(index);
          },
          onLongPress: () {
            _deletePicture(index);
          },
          child: Image.file(
            File(_imageFiles[index].path),
            fit: BoxFit.fitWidth,
          ),
        ));
  }

  _deletePicture(int index) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return TDAlertDialog(
          title: '提示',
          content: '删除该页？',
          rightBtnAction: () {
            _removeFromCalendar(index);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  _addToCalendar(XFile image) {
    setState(() {
      _imageFiles.add(image);
    });
  }

  _removeFromCalendar(int index) {
    setState(() {
      _imageFiles.removeAt(index);
      calendarLength = calendarLength - 1;
    });
  }

  _viewImages(int index) {
    TDImageViewer.showImageViewer(
        context: context,
        deleteBtn: false,
        defaultIndex: index,
        images: _imageFiles.map((file) => File(file.path)).toList(),
        onDelete: (index) => _deletePicture(index));
  }

  _scrollToIndex(int index) {
    double scrollContainerWidth =
        MediaQuery.of(context).size.width - spacingTight * 2;
    double scrollContentWidth =
        index * (widthSmallItem + spacingTight) - spacingTight;

    bool needToScroll = scrollContentWidth > scrollContainerWidth;

    if (!needToScroll) return;

    _scrollController.animateTo(
      _scrollController.offset + widthSmallItem + spacingTight,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  _takePicture(PhotoCameraState photoCameraState) async {
    _scrollToIndex(calendarLength + 1);
    setState(() {
      calendarLength = calendarLength + 1;
    });

    final captureRequest = await photoCameraState.takePhoto();

    captureRequest.when(single: (single) {
      if (single.file != null) _addToCalendar(single.file!);
    });
  }

  _markPaper() {
    if (_imageFiles.isEmpty) {
      TDToast.showIconText('图片为空',
          icon: TDIcons.close_circle, context: context);
      return;
    }
    navigateWithSlideTransition(context, MarkPage(imageFiles: _imageFiles));
  }
}
