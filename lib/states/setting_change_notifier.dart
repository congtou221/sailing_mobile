part of 'index.dart';

class SettingChangeNotifier extends ChangeNotifier {
  // Setting _setting = Global.setting;

  @override
  void notifyListeners() {
    Global.savePrefs();
    super.notifyListeners();
  }
}
