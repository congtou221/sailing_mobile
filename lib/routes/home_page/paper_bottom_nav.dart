import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../widgets/sailing_bottom_navigation_bar.dart';

class PaperBottomNavBar extends StatelessWidget {
  const PaperBottomNavBar(
      {super.key,
      required this.selectedIndex,
      required this.onBottomNavigationItemTapped});
  final int selectedIndex;
  final void Function(int index) onBottomNavigationItemTapped;

  @override
  Widget build(BuildContext context) {
    return SailingBottomNavigationBar(items: [
      {
        'selectedicon': Icon(
          TDIcons.app,
          size: 20,
          color: TDTheme.of(context).brandNormalColor,
        ),
        'unselectedicon': const Icon(
          TDIcons.app,
          size: 20,
        ),
        'title': '广场',
      },
      {
        'selectedicon': Icon(
          TDIcons.app,
          size: 20,
          color: TDTheme.of(context).brandNormalColor,
        ),
        'unselectedicon': const Icon(
          TDIcons.app,
          size: 20,
        ),
        'title': '组卷'
      },
      {
        'selectedicon': Icon(
          TDIcons.app,
          size: 20,
          color: TDTheme.of(context).brandNormalColor,
        ),
        'unselectedicon': const Icon(
          TDIcons.app,
          size: 20,
        ),
        'title': '收藏',
      }
    ], onTap: onBottomNavigationItemTapped);
  }
}
