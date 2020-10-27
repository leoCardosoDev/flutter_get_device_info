import 'dart:io';

import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';

class GetDeviceInfo {
  Future<List<String>> getLocalDeviceDetails() async {
    String deviceId;
    String deviceBrand;
    String deviceModel;

    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        var androidInfo = await deviceInfoPlugin.androidInfo;
        deviceId = androidInfo.androidId;
        deviceBrand = androidInfo.brand;
        deviceModel = androidInfo.model;
      } else if (Platform.isIOS) {
        var iosInfo = await deviceInfoPlugin.iosInfo;
        deviceId = iosInfo.identifierForVendor;
        deviceBrand = iosInfo.name;
        deviceModel = iosInfo.model;
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

    return [deviceId, deviceBrand, deviceModel];
  }
}
