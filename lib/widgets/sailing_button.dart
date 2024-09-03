import 'package:flutter/material.dart';
import 'package:sailing_mobile/common/theme.dart';

class SailingIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  const SailingIconButton(
      {Key? key, required this.iconData, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      // splashColor: transparentColor, // 移除水波纹效果
      // highlightColor: transparentColor, // 移除高亮效果
      radius: zeroSize,
      child: Padding(
        padding: EdgeInsets.all(mediumPadding),
        child: Icon(iconData),
      ),
    );
  }
}
