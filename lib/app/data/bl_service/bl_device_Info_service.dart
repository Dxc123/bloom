// import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';


//app设备信息
class BlDeviceInfoService extends GetxService {
  static BlDeviceInfoService get to => Get.find();
  late String deviceIdentifier;
  late String deviceModel;
  late String appSystemVersionKey;
  late String version;
  late String buildNumber;
  //安卓packageName
  late String? appPackageName;
  //app名称
  late String? appName;


  Future<BlDeviceInfoService> init() async {
    // 设备信息
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    // const androidIdPlugin = AndroidId();

    PackageInfo? packageInfo = await PackageInfo.fromPlatform();
    appPackageName = packageInfo.packageName;
    appName = packageInfo.appName;

    if (GetPlatform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;

      appSystemVersionKey = iosDeviceInfo.systemVersion;
      deviceIdentifier = "${iosDeviceInfo.identifierForVendor ?? ""}-${iosDeviceInfo.utsname.machine}";
      deviceModel = "ios ${iosDeviceInfo.model}";
    } else if (GetPlatform.isAndroid) {
      // AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      // final String? androidId = await androidIdPlugin.getId();
      //
      // appSystemVersionKey = androidDeviceInfo.version.release;
      // // deviceIdentifier = (androidDeviceInfo.androidId ?? "") + "-" + (androidDeviceInfo.brand ?? "");
      // deviceIdentifier = "${androidId ?? ""}-${androidDeviceInfo.brand}";
      // // deviceModel = "android ${androidDeviceInfo.model}";
      // deviceModel = "android ${androidDeviceInfo.model.replaceAll(",", "_") ?? "android"}";
    }
    // 包信息
    final info = await PackageInfo.fromPlatform();
    version = info.version;
    buildNumber = info.buildNumber;
    return this;
  }


// //TODO： 第一个版本白包 设备信息写死
// Future<BlDeviceInfoService> init()   async {
//   appPackageName = "com.walrus.zest";
//   appName = "Zest";
//   WiLogTool.debug("appPackageName = $appPackageName \n appName = $appName");
//   if (GetPlatform.isIOS) {
//     appSystemVersionKey = "18.2";
//     deviceIdentifier = "92290654-486F-453B-893C-9AB60E2EDB4C-iPhone17,2";
//     deviceModel = "ios iPhone";
//     WiLogTool.debug("deviceIdentifier = $deviceIdentifier \n deviceModel = $deviceModel");
//   } else if (GetPlatform.isAndroid) {
//     deviceIdentifier = "cc040a68b5b6ae17-samsung";
//     deviceModel = "android SM-G532G";
//     WiLogTool.debug("deviceIdentifier = $deviceIdentifier \n deviceModel = $deviceModel");
//   }
//   // 包信息
//   version = "1.0.0";
//   buildNumber = "1";
//   return this;
// }
}
