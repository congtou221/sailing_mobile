import 'package:flutter/material.dart';

import '../common/theme.dart';
import 'index.dart';

class SailingBottomNavigationBar extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int currentIndex;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final ValueChanged<int>? onTap;

  SailingBottomNavigationBar({
    required this.items,
    required this.currentIndex,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SailingPaddingLeftRight(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          List.generate(items.length, (index) => _buildBarItem(context, index)),
    ));
  }

  Widget _buildBarItem(BuildContext context, int index) {
    final bool isSelected = index == currentIndex;
    final Widget icon = Icon(items[index]['icon'],
        color: isSelected ? selectedItemColor : unselectedItemColor);
    final Widget title = Text(
      items[index]['title'],
      style: TextStyle(
          color: isSelected ? selectedItemColor : unselectedItemColor,
          fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
          height: Theme.of(context).textTheme.bodyLarge!.height),
    );

    return InkWell(
      onTap: () {
        onTap?.call(index);
      },
      radius: zeroSize,
      child: Container(
        height: bottomNavigationBarHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        child: SailingPaddingEven(
            child: Column(
          children: [icon, title],
        )),
      ),
    );
  }
}
