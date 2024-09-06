import 'package:flutter/material.dart';

import '../../widgets/index.dart';
import 'courseware_bottom_nav.dart';

class CoursewareHomePage extends StatefulWidget {
  const CoursewareHomePage({super.key});

  @override
  _CoursewareHomeState createState() => _CoursewareHomeState();
}

class _CoursewareHomeState extends State<CoursewareHomePage> {
  int _selectedIndex = 0;
  List<String> titles = ['课件', '我的', '收藏'];

  @override
  Widget build(BuildContext context) {
    return SailingScaffold(
        title: titles[_selectedIndex],
        body: _buildBody(context, _selectedIndex),
        bottomNavigationBar: _buildBottomNavigation(_selectedIndex));
  }

  Widget _buildBody(BuildContext context, int index) {
    switch (index) {
      case 0:
        return _buildCoursewareHomeBody(context);
      case 1:
        return _buildCoursewareMyBody(context);
      case 2:
        return _buildCoursewareFavorateBody(context);
      default:
        return Container();
    }
  }

  Widget _buildCoursewareHomeBody(BuildContext context) {
    return Container();
  }

  Widget _buildCoursewareMyBody(BuildContext context) {
    return Container();
  }

  Widget _buildCoursewareFavorateBody(BuildContext context) {
    return Container();
  }

  Widget _buildBottomNavigation(int index) {
    return CoursewareBottomNavBar(
        selectedIndex: index,
        onBottomNavigationItemTapped: _onBottomNavigationItemTapped);
  }

  void _onBottomNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
