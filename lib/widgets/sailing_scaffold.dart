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
        appBar: SailingNavbar(
          title: title,
          leftBarItems: [
            TDNavBarItem(
              icon: TDIcons.ellipsis,
              iconSize: iconSize,
              action: () {
                _openDrawer(scaffoldKey);
              },
            ),
          ],
          rightBarItems: [
            TDNavBarItem(
              icon: TDIcons.photo,
              iconSize: iconSize,
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

  _openCamera(BuildContext context) async {
    Global.cameraPermissionManager.requestCameraPermission(context, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CameraScreenPage(camera: Global.camera)));
    });
  }

  _openDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState?.openDrawer();
  }
}
