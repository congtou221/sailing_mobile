part of 'index.dart';

class UserModel extends SettingChangeNotifier {
  Setting _setting = Global.setting;

  String? get username => _setting.username;

  bool get isLogin => username != null;

  set username(String? username) {
    _setting.username = username;
    notifyListeners();
  }
}
