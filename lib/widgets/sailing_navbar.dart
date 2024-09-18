part of 'index.dart';

class SailingNavbar extends StatelessWidget implements PreferredSizeWidget {
  const SailingNavbar({
    super.key,
    this.title,
    this.titleWidget,
    this.backgroundColor,
    this.leftBarItems,
    this.rightBarItems,
  });

  /// 标题控件，优先级高于title文案
  final Widget? titleWidget;

  /// 标题文案
  final String? title;

  /// 背景颜色
  final Color? backgroundColor;

  /// 左边操作项
  final List<TDNavBarItem>? leftBarItems;

  /// 右边操作项
  final List<TDNavBarItem>? rightBarItems;

  @override
  Widget build(BuildContext context) {
    return TDNavBar(
        padding:
            EdgeInsets.only(left: spacingBaseTight, right: spacingBaseTight),
        height: navigationBarHeight,
        titleWidget: titleWidget,
        title: title,
        backgroundColor: backgroundColor,
        useDefaultBack: false,
        leftBarItems: leftBarItems,
        rightBarItems: rightBarItems);
  }

  @override
  Size get preferredSize => Size.fromHeight(navigationBarHeight);
}
