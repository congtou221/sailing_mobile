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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Consumer<ThemeModel>(builder: (context, themeModel, child) {
      return Scaffold(
        key: scaffoldKey,
        appBar: TDNavBar(
          padding:
              EdgeInsets.only(left: spacingBaseTight, right: spacingBaseTight),
          height: navigationBarHeight,
          title: title,
          screenAdaptation: true,
          useDefaultBack: false,
          leftBarItems: [
            TDNavBarItem(
              icon: TDIcons.ellipsis,
              iconSize: 24,
              action: () {
                _openDrawer(scaffoldKey);
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
    navigateWithSlideTransition(
        context, TakePictureScreen(camera: Global.camera));
  }

  _openDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState?.openDrawer();
  }
}
