import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../models/cache.dart';
import '../models/setting.dart';
import '../ulib/request.dart';
import '../ulib/tools.dart';
import '../ulib/permission_manager.dart';
// import 'theme.dart';

// Map<String, ThemeData> _themes = {'light': lightTheme, 'dark': darkTheme};

class Global {
  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");
  // 获取主题列表
  // static Map<String, ThemeData> get themes => _themes;
  // 初始化Hive
  // static Future<void> initHive() async {
  // final directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // Hive.registerAdapter(NoteAdapter());
  // }
  static late SharedPreferences _prefs;
  static Setting setting = Setting();
  static late CameraDescription camera;
  static late TDThemeData theme;
  static late PermissionManager permissionManager;
  static late CameraPermissionManager cameraPermissionManager;

  static initPrefs() async {
    _prefs = await SharedPreferences.getInstance();

    var _setting = _prefs.getString("setting");

    if (_setting != null) {
      try {
        setting = Setting.fromJson(jsonDecode(_setting));
      } catch (e) {
        print(e);
      }
    }

    setting.theme = isDarkMode() ? 'dark' : 'light';
    setting.cache = setting.cache ?? Cache()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;
  }

  static savePrefs() {
    _prefs.setString("setting", jsonEncode(setting.toJson()));
  }

  static initSystemUI() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
    //     overlays: [SystemUiOverlay.top]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: isDarkMode() ? Brightness.dark : Brightness.light,
      statusBarIconBrightness:
          isDarkMode() ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          isDarkMode() ? Brightness.dark : Brightness.light,
      systemNavigationBarContrastEnforced: true,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 只允许向上竖屏
    ]);
  }

  static initCamera() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    camera = cameras.first;
  }

  static initPermissionManager() {
    permissionManager = PermissionManager();
    cameraPermissionManager =
        CameraPermissionManager(permissionManager: permissionManager);
  }

  static initTheme() async {
    TDTheme.needMultiTheme();
    var jsonString = await rootBundle.loadString('assets/theme.json');
    theme = TDThemeData.fromJson('sailing', jsonString) ??
        TDThemeData.defaultData();
  }

  static Future<void> init() async {
    // 初始化Flutter基础结构
    WidgetsFlutterBinding.ensureInitialized();

    initSystemUI();

    // 初始化网络请求
    Request.init();

    initPermissionManager();

    try {
      // 初始化本地持久化存储
      await initPrefs();
      // 初始化摄像头
      await initCamera();

      await initTheme();
    } catch (e) {}
  }
}
