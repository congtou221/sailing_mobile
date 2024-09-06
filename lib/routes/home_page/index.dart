import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../widgets/index.dart';
import 'paper_bottom_nav.dart';

class PaperHomePage extends StatefulWidget {
  const PaperHomePage({super.key});

  @override
  _PaperHomePageState createState() => _PaperHomePageState();
}

class _PaperHomePageState extends State<PaperHomePage> {
  int _selectedIndex = 0;
  List<String> titles = ['试卷', '我的', '收藏'];

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
        return _buildHomeBody(context);
      case 1:
        return _buildMyBody(context);
      case 2:
        return _buildFavorateBody(context);
      default:
        return Container();
    }
  }

  Widget _buildHomeBody(BuildContext context) {
    return Container();
  }

  Widget _buildMyBody(BuildContext context) {
    return Container();
  }

  Widget _buildFavorateBody(BuildContext context) {
    return Container();
  }

  Widget _buildBottomNavigation(int index) {
    return PaperBottomNavBar(
        selectedIndex: index,
        onBottomNavigationItemTapped: _onBottomNavigationItemTapped);
  }

  void _onBottomNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
