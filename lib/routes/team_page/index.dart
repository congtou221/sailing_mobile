import 'package:flutter/material.dart';

import '../../widgets/index.dart';
import 'team_bottom_nav.dart';

class TeamHomePage extends StatefulWidget {
  const TeamHomePage({super.key});

  @override
  _TeamHomeState createState() => _TeamHomeState();
}

class _TeamHomeState extends State<TeamHomePage> {
  int _selectedIndex = 0;
  List<String> titles = ['班级', '聊天', '联系人'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SailingScaffold(
        title: Text(titles[_selectedIndex]),
        body: _buildTeamBody(context, _selectedIndex),
        bottomNavigationBar: _buildBottomNavigation(_selectedIndex));
  }

  Widget _buildTeamBody(BuildContext context, int index) {
    switch (index) {
      case 0:
        return _buildTeamHomeBody(context);
      case 1:
        return _buildTeamMyBody(context);
      case 2:
        return _buildTeamFavorateBody(context);
      default:
        return Container();
    }
  }

  Widget _buildTeamHomeBody(BuildContext context) {
    return Container();
  }

  Widget _buildTeamMyBody(BuildContext context) {
    return Container();
  }

  Widget _buildTeamFavorateBody(BuildContext context) {
    return Container();
  }

  Widget _buildBottomNavigation(int index) {
    return TeamBottomNavBar(
        selectedIndex: index,
        onBottomNavigationItemTapped: _onBottomNavigationItemTapped);
  }

  void _onBottomNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
  


// class _TeamHomeState extends State<TeamHomePage> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SailingScaffold(
//         body: _buildTeamHomeBody(),
//         bottomNavigationBar: TeamBottomNavBar(selectedIndex: _selectedIndex));
//   }

//   Widget _buildTeamHomeBody() {
//     return const Center(child: Text('TeamHome'));
//   }
// }
