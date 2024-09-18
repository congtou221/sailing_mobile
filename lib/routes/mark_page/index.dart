import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sailing_mobile/models/paper_mark_details.dart';
import 'package:sailing_mobile/widgets/index.dart';
import 'package:sailing_mobile/widgets/siling_badge_button.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../common/theme.dart';
import '../../models/oss_token.dart';
import '../../ulib/request.dart';
import '../../ulib/tools.dart';

class MarkPage extends StatefulWidget {
  const MarkPage({super.key, required this.imageFiles});

  final List<XFile> imageFiles;

  @override
  State<MarkPage> createState() => MarkPageState();
}

class MarkPageState extends State<MarkPage> {
  bool loading = true;

  late Details details;

  @override
  void initState() {
    super.initState();

    _initDetails();
  }

  @override
  Widget build(BuildContext context) {
    return loading ? _renderLoading() : _renderMark();
  }

  _renderLoading() {
    return const Scaffold(
        body: Center(
            child: TDLoading(
      size: TDLoadingSize.large,
      icon: TDLoadingIcon.circle,
    )));
  }

  _renderMark() {
    return Scaffold(
        appBar: SailingNavbar(leftBarItems: [
          TDNavBarItem(
              icon: TDIcons.close,
              iconSize: iconSize,
              action: () {
                Navigator.pop(context);
              }),
        ]),
        body: SailingPaddingBaseTightLeftRight(
          child: Column(
            children: [
              _renderPaperTitle(),
              _renderUserInfo(),
              _renderMarkDetails()
            ],
          ),
        ));
  }

  _renderPaperTitle() {
    return SailingPaddingTopBottomTight(
        child: TDText(
      details.paperTitle,
      font: TDTheme.of(context).fontTitleMedium,
    ));
  }

  _renderUserInfo() {
    return SailingPaddingTopBottomTight(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SailingAvatarMedium(
          src: details.assessee.avatar.replaceFirst('https', 'http')),
      SailingPaddingLeftTight(
          child: TDText(details.assessee.name,
              font: TDTheme.of(context).fontTitleSmall,
              fontWeight: FontWeight.w600))
    ]));
  }

  _renderMarkDetails() {
    return SailingPaddingTopBottomTight(
        child: Column(
            children:
                details.types.map((type) => _renderMarkOfType(type)).toList()));
  }

  Widget _renderMarkOfType(Types type) {
    return SailingPaddingTopBottomTight(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SailingPaddingTopBottomTight(
          child: TDText(
            type.title,
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        SailingPaddingTopBottomTight(
          child: _renderQuestions(type.questions),
        )
      ],
    ));
  }

  Widget _renderQuestions(List<Questions> questions) {
    return Flex(
      direction: Axis.horizontal,
      children: questions
          .asMap()
          .entries
          .expand((entry) => [
                _renderQuestionItem(entry),
                if (entry.key < questions.length - 1)
                  SizedBox(width: 12), // 插入间距
              ])
          .toList(),
    );
  }

  Widget _renderQuestionItem(MapEntry<int, Questions> question) {
    return SailingBadgeButton(
      title: question.key.toString(),
      badge: '${question.value.score} 分',
      showBadge: question.value.markStatus == 1,
      color: question.value.score == question.value.fullScore
          ? TDTheme.of(context).successColor5
          : TDTheme.of(context).errorColor6,
    );
  }

  _initDetails() async {
    try {
      // 获取 OSS Token
      OssToken res = await Request(context).getOSSToken();
      if (res.data.signed_URL!.isEmpty) return;

      // 压缩图片并上传到 OSS
      final zipFile = await zipImages(widget.imageFiles);
      await putToOSS(res.data.signed_URL!, zipFile);

      // 将 OSS 地址传给后台
      PaperMarkDetails markDetails = await Request(context)
          .getPaperMarkDetails({'assess_id': 123, 'scanned_data': ''});

      setState(() {
        details = markDetails.data.details;
      });
    } catch (e) {
      TDToast.showIconText(e.toString(),
          icon: TDIcons.close_circle, context: context);

      Navigator.pop(context);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}
