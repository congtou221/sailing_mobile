part of 'index.dart';

class ThemeModel extends SettingChangeNotifier {
  Setting _setting = Global.setting;
  // List<MaterialColor> get themes => Global.themes;

  String get theme => _setting.theme ?? 'light';

  set theme(String mode) {
    if (mode != theme) {
      _setting.theme = mode;
      notifyListeners();
    }
  }
}
