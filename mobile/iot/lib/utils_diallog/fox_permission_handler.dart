import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import 'fox_logger.dart';

class FoxPermissionHandle {
  static Future<bool> onCheckCameraPermission() async {
    try {
      var _permissionCamera = await Permission.camera.status;
      if(_permissionCamera.isUndetermined) {
        print("The permission wasn't requested yet.");
        await Permission.camera.request().isGranted.then((value) {
          return value;
        });
      } else if(_permissionCamera.isGranted) {
        return true;
      } else if(_permissionCamera.isDenied) {
        print("The user denied access to the requested feature.");
        openAppSettings();
        return false;
      } else if (_permissionCamera.isRestricted) {
        if(Platform.isIOS) {
          print("The OS denied access to the requested feature. The user cannot change this app's status, possibly due to active restrictions such as parental controls being in place.");
        }
      } else if(_permissionCamera.isPermanentlyDenied) {
        if(Platform.isAndroid) {
          print("The user denied access to the requested feature and selected to never again show a request for this permission. The user may still change the permission status in the settings.");
          openAppSettings();
          return false;
        }
      }
    } catch (error) {
      logger.e(error);
    }
  }

  static Future<bool> onCheckGalleryPermission() async {
    try {
      var _permissionGallery = Platform.isAndroid ? await Permission.storage.status : await Permission.photos.status;
      if(_permissionGallery.isUndetermined) {
        print("The permission wasn't requested yet.");
        await Permission.camera.request().isGranted.then((value) {
          return value;
        });
      } else if(_permissionGallery.isGranted) {
        return true;
      } else if(_permissionGallery.isDenied) {
        print("The user denied access to the requested feature.");
        openAppSettings();
        return false;
      } else if (_permissionGallery.isRestricted) {
        if(Platform.isIOS) {
          print("The OS denied access to the requested feature. The user cannot change this app's status, possibly due to active restrictions such as parental controls being in place.");
        }
      } else if(_permissionGallery.isPermanentlyDenied) {
        if(Platform.isAndroid) {
          print("The user denied access to the requested feature and selected to never again show a request for this permission. The user may still change the permission status in the settings.");
          openAppSettings();
          return false;
        }
      }
    } catch (error) {
      logger.e(error);
    }
  }
}