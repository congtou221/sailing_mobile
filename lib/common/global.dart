import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cache.dart';
import '../models/setting.dart';
import '../ulib/request.dart';
import '../ulib/tools.dart';
import 'theme.dart';

Map<String, ThemeData> _themes = {'light': lightTheme, 'dark': darkTheme};

class Global {
  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");
  // 获取主题列表
  static Map<String, ThemeData> get themes => _themes;
  // 初始化Hive
  // static Future<void> initHive() async {
  // final directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // Hive.registerAdapter(NoteAdapter());
  // }
  static late SharedPreferences _prefs;
  static Setting setting = Setting();
  static late CameraDescription camera;

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
      statusBarColor: transparentColor,
      statusBarBrightness: isDarkMode() ? Brightness.dark : Brightness.light,
      statusBarIconBrightness:
          isDarkMode() ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: transparentColor,
      systemNavigationBarDividerColor: transparentColor,
      systemNavigationBarIconBrightness:
          isDarkMode() ? Brightness.dark : Brightness.light,
      systemNavigationBarContrastEnforced: true,
    ));
  }

  static initCamera() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    camera = cameras.first;
  }

  static Future<void> init() async {
    // 初始化Flutter基础结构
    WidgetsFlutterBinding.ensureInitialized();
    // 初始化本地持久化存储
    await initPrefs();
    // 初始化网络请求
    Request.init();
    // 初始化摄像头
    await initCamera();

    initSystemUI();
  }
}
