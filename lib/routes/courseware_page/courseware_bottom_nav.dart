import 'package:flutter/material.dart';

import '../../widgets/sailing_bottom_navigation_bar.dart';

class CoursewareBottomNavBar extends StatelessWidget {
  const CoursewareBottomNavBar(
      {super.key,
      required this.selectedIndex,
      required this.onBottomNavigationItemTapped});
  final int selectedIndex;
  final void Function(int index) onBottomNavigationItemTapped;

  @override
  Widget build(BuildContext context) {
    return SailingBottomNavigationBar(
        items: const [
          {
            'icon': Icons.description,
            'title': '广场',
          },
          {'icon': Icons.person, 'title': '组卷'},
          {
            'icon': Icons.star,
            'title': '收藏',
          }
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).textTheme.bodyLarge?.color,
        onTap: onBottomNavigationItemTapped);
  }
}
