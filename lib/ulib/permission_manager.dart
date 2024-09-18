import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:app_settings/app_settings.dart';

import '../common/global.dart';

class PermissionManager {
  Future<bool> requestPermission(Permission permission) async {
    // 请求权限
    final status = await permission.request();
    return status.isGranted;
  }

  Future<bool> checkPermission(Permission permission) async {
    // 检查权限状态
    final status = await permission.status;
    return status.isGranted;
  }

  Future<void> openAppSettings() async {
    // 打开应用设置页面
    // const TDConfirmDialog(title: '相机权限未开启');
  }

  Future<void> handlePermission(
      Permission permission, Function(bool) onResult) async {
    // 处理权限请求
    final status = await permission.status;
    print('权限状态: $permission，$status');

    if (status.isGranted) {
      // 权限已被授予
      onResult(true);
    } else if (status.isPermanentlyDenied) {
      // 权限被永久拒绝
      // openAppSettings();
      onResult(false);
    } else if (status.isDenied) {
      // 权限被拒绝，重新请求
      final result = await requestPermission(permission);
      onResult(result);
    } else if (status.isLimited) {
      // 权限部分被授予
      onResult(true);
    } else if (status.isRestricted) {
      // 权限被系统限制
      onResult(false);
    }
  }
}

class CameraPermissionManager {
  final PermissionManager permissionManager;

  CameraPermissionManager({
    required this.permissionManager,
  });

  Future<void> requestCameraPermission(
      BuildContext context, Function() successCallback) async {
    // 请求相机权限
    final permissionManager = Global.permissionManager;

    permissionManager.handlePermission(Permission.camera,
        (hasCameraPermission) {
      if (hasCameraPermission) {
        successCallback();
      } else {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return TDAlertDialog(
                title: '相机权限未开启',
                content: '请在系统设置中，允许Sailing访问你的摄像头',
                leftBtn: TDDialogButtonOptions(
                  title: '我知道了',
                  action: () => {Navigator.pop(context)},
                ),
                rightBtn: TDDialogButtonOptions(
                  title: '前往设置',
                  theme: TDButtonTheme.primary,
                  action: () => {AppSettings.openAppSettings()},
                ));
          },
        );
      }
    });
  }
}
