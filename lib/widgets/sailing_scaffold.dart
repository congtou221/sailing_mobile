part of 'index.dart';

class SailingScaffold extends StatelessWidget {
  const SailingScaffold(
      {super.key,
      required this.body,
      required this.bottomNavigationBar,
      required this.title});
  final String title;
  final Widget body;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, themeModel, child) {
      return Scaffold(
        appBar: TDNavBar(
          height: 48,
          title: title,
          // leading: Builder(builder: (context) {
          //   return SailingIconButton(
          //     iconData: TDIcons.ellipsis,
          //     onPressed: () {
          //       Scaffold.of(context).openDrawer();
          //     },
          //   );
          // }),
          screenAdaptation: true,
          useDefaultBack: false,
          leftBarItems: [
            TDNavBarItem(
              icon: TDIcons.ellipsis,
              iconSize: 24,
              action: () {
                _openDrawer(context);
              },
            ),
          ],
          rightBarItems: [
            TDNavBarItem(
              icon: TDIcons.photo,
              iconSize: 24,
              action: () {
                _openCamera(context);
              },
            ),
          ],
        ),
        body: body,
        drawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: const HomeDrawer()),
        bottomNavigationBar: bottomNavigationBar,
      );
    });
  }

  _openCamera(BuildContext context) {
    // navigateWithSlideTransition(
    //     context, TakePictureScreen(camera: Global.camera));
  }

  _openDrawer(BuildContext context) {
    // Scaffold.of(context).openDrawer();

    TDDrawer(
      context,
      visible: true,
      placement: TDDrawerPlacement.left,
      style: TDCellStyle(
        backgroundColor: TDTheme.of(context).grayColor1,
      ),
      items: [
        TDDrawerItem(
            content: SailingScreenHeightContainer(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SailingExpandedAlignmentleftContainer(
                    child: _buildDrawerHeader(context)),
                Text('功能切换', style: Theme.of(context).textTheme.titleSmall),
                // SailingPadding(
                //     child: Text('功能切换',
                //         style: Theme.of(context).textTheme.titleSmall)),
                SailingExpandedAlignmentcenterContainer(
                    child: _buildDrawerMenu(context)),
                SailingPaddingTop(
                  child: SailingExpandedContainer(
                      onTap: () => _openSetting(context),
                      child: _buildDrawerSetting(context)),
                )
              ]),
        ))
      ],
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return SailingPaddingTopSafeArea(
        child: SailingPaddingEven(
      child: Column(children: [
        const SailingAvatar(src: "images/avatar.png"),
        SailingPaddingText(
            child: Text("Andy", style: Theme.of(context).textTheme.titleLarge))
      ]),
    ));
  }

  Widget _buildDrawerMenu(BuildContext context) {
    List<Map<String, dynamic>> menuItems = [
      {'text': '试卷', 'src': 'images/paper.png', 'onTap': _openPaper},
      {
        'text': '课件',
        'src': 'images/courseware_litup.png',
        'onTap': _openCourseware
      },
      {'text': '班级', 'src': 'images/team.png', 'onTap': _openTeam},
    ];

    return SailingPadding(
        child: SailingRowSpaceBetween(
            children: menuItems.map((item) {
      return SailingContainer(
        onTap: () => item['onTap'](context),
        child: Column(
          children: [
            SailingMenuImage(src: item['src'] ?? ''),
            SailingPaddingText(
                child: Text(item['text'] ?? '',
                    style: Theme.of(context).textTheme.titleSmall))
          ],
        ),
      );
    }).toList()));
  }

  Widget _buildDrawerSetting(BuildContext context) {
    return SailingPadding(
        child: SailingExpandedAlignmentcenterContainer(
            child: SailingRowSpaceBetween(children: [
      SailingContainer(
          child: Row(
        children: [
          const Icon(Icons.settings),
          SailingPaddingLeft(
              child: Text(
            '设置',
            style: Theme.of(context).textTheme.titleMedium,
          ))
        ],
      )),
      const Icon(Icons.chevron_right)
    ])));
  }

  void _openSetting(BuildContext context) {
    // Navigator.of(context).pushNamed('/setting');
  }

  void _openPaper(BuildContext context) {
    navigateWithSlideTransition(context, const PaperHomePage());
  }

  void _openCourseware(BuildContext context) {
    navigateWithSlideTransition(context, const CoursewareHomePage());
  }

  void _openTeam(BuildContext context) {
    navigateWithSlideTransition(context, const TeamHomePage());
  }
}
