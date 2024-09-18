import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sailing_mobile/common/theme.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../ulib/tools.dart';
import '../../widgets/index.dart';
import '../mark_page/index.dart';

class CameraScreenPage extends StatefulWidget {
  const CameraScreenPage({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  CameraScreenPageState createState() => CameraScreenPageState();
}

class CameraScreenPageState extends State<CameraScreenPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late List<XFile> _imageFiles;
  late ScrollController _scrollController;
  late bool _readyToRender; // 用于控制iphone相机页面退出：提前关闭视频流，避免出现退出页面卡顿
  late List<String> _paperList;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    deleteFiles(_imageFiles);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SailingSizedContainer(
            color: blackColor,
            child: Column(
              children: [
                _renderCamera(),
                _renderCalendar(),
              ],
            )));
  }

  _init() async {
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.max,
      enableAudio: false,
    );

    _scrollController = ScrollController();

    _initializeControllerFuture = _controller.initialize();

    _controller.lockCaptureOrientation();

    _imageFiles = [];

    _readyToRender = true;

    _paperList = ['模拟考试一', '模拟考试二'];
  }

  _calcScale() {
    var camera = _controller.value;

    if (!camera.isInitialized) return 1.0;

    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;
    return scale;
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
                setState(() {
                  _readyToRender = false;
                });
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

  _renderCamera() {
    return Expanded(
        child: FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            _readyToRender) {
          return Stack(children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Transform.scale(
                scale: _calcScale(),
                child: Center(
                  child: CameraPreview(_controller),
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              child: _renderCameraScreenNavBar(),
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: spacingExtraLoose,
                child: Center(child: SailingCameraButton(onTap: _takePicture))),
          ]);
        } else {
          return SailingSizedContainer(color: blackColor);
        }
      },
    ));
  }

  _renderCalendar() {
    return SafeArea(
        child: SailingSizedContainer(
            height: heightSmallItem + spacingTight * 2,
            color: blackColor,
            child: SailingPaddingEvenTight(
                child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _imageFiles.length,
                    itemBuilder: (BuildContext context, int index) => index == 0
                        ? _renderCalendarItem(index)
                        : SailingPaddingLeftTight(
                            child: _renderCalendarItem(index))))));
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
            child: TDImage(
              imageFile: File(_imageFiles[index].path),
              type: TDImageType.fitWidth,
            )));
  }

  _viewImages(int index) {
    TDImageViewer.showImageViewer(
        context: context,
        deleteBtn: false,
        defaultIndex: index,
        images: _imageFiles.map((file) => File(file.path)).toList(),
        onDelete: (index) => _deletePicture(index));
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
            _removeFromCalendar(_imageFiles[index]);
            Navigator.pop(context);
          },
        );
      },
    );
    ;
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      _addToCalendar(image);
    } catch (e) {}
  }

  _addToCalendar(XFile image) {
    setState(() {
      _imageFiles.add(image);
    });
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  _removeFromCalendar(XFile image) {
    setState(() {
      _imageFiles.remove(image);
    });
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
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
