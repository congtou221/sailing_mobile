import 'package:flutter/widgets.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SailingBadgeButton extends StatelessWidget {
  const SailingBadgeButton({
    super.key,
    required this.title,
    required this.badge,
    required this.color,
    this.showBadge = false,
  });

  final String title;
  final String badge;
  final Color color;
  final bool? showBadge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 57,
      height: 48,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              color: TDTheme.of(context).grayColor2,
              borderRadius:
                  BorderRadius.circular(TDTheme.of(context).radiusDefault),
              border: Border.all(
                color: TDTheme.of(context).grayColor4, // 设置边框颜色
                width: 1.0, // 设置边框宽度
              ),
            ),
            height: TDTheme.of(context).spacer40,
            width: TDTheme.of(context).spacer40,
            child: Center(
                child:
                    TDText(title, font: TDTheme.of(context).fontTitleMedium)),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: TDBadge(
              TDBadgeType.bubble,
              count: badge,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
