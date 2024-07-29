part of 'index.dart';

class SailingScaffold extends StatelessWidget {
  const SailingScaffold(
      {super.key,
      required this.body,
      required this.bottomNavigationBar,
      required this.title});
  final Widget title;
  final Widget body;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, themeModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: title,
          leading: Builder(builder: (context) {
            return SailingIconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions: <Widget>[
            SailingIconButton(
              icon: const Icon(
                Icons.photo_camera,
              ),
              onPressed: _openCamera,
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

  Future<void> _openCamera() async {
    // final picker = ImagePicker();
    // final pickedFile = await picker.getImage(source: ImageSource.camera);
    // if (pickedFile != null) {
    //   print(pickedFile.path);
    // }
  }
}
