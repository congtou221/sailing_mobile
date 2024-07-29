import 'package:flutter/material.dart';
import 'package:sailing_mobile/common/theme.dart';

class SailingIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  const SailingIconButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashColor: transparentColor, // 移除水波纹效果
      highlightColor: transparentColor, // 移除高亮效果
      icon: icon,
      padding: EdgeInsets.all(mediumPadding),
    );
  }
}
