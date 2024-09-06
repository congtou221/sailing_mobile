import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SailingBottomNavigationBar extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final ValueChanged<int>? onTap;

  SailingBottomNavigationBar({
    required this.items,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TDBottomTabBar(TDBottomTabBarBasicType.iconText,
        componentType: TDBottomTabBarComponentType.normal,
        useVerticalDivider: false,
        navigationTabs: List.generate(
            items.length,
            (index) => TDBottomTabBarTabConfig(
                tabText: items[index]['title'],
                selectedIcon: items[index]['selectedicon'],
                unselectedIcon: items[index]['unselectedicon'],
                onTap: () {
                  onTap?.call(index);
                })));
  }
}
