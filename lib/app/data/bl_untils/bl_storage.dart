
import 'package:get_storage/get_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

abstract class BlStorage{
  static GetStorage? _storage;

  // static SharedPreferences? _prefs;

  static initStorage() async {
    await GetStorage.init();
    _storage = GetStorage();
    // _prefs = await SharedPreferences.getInstance();
  }

  ///////////////////////////////////////////////////////////////
  // GetStorage储存
  static Future<void> write(String key, dynamic value) async {
    await _storage?.write(key, value);
  }

  /// 存储列表（支持泛型类型）
  /// await StorageUtils.saveList<int>('userScores', [100, 90, 85]);
  static Future<void> writeList<T>(String key, List<T> value) async {
    await _storage?.write(key, value);
  }

  static dynamic read(String key) {
    return _storage?.read(key);
  }

  /// 获取列表
  /// List<int>? userScores = StorageUtils.getList<int>('userScores');
  static List<T>? readList<T>(String key) {
    return _storage?.read<List<T>>(key);
  }

  static Future<void> remove(String key) async {
    await _storage?.remove(key);
  }

  static Future<void> clear() async {
    await _storage?.erase();
  }


  static dynamic getKeys(String key) {
    return _storage?.getKeys();
  }

  static  dynamic getValues(String key) {
    return _storage?.getValues();
  }

  static bool hasData(String key) {
    return _storage?.hasData(key) ?? false;
  }

  //  数据监听
  static dynamic listenKey(String key) {
    return _storage?.listenKey(key, (value) {});
  }

  ///////////////////////////////////////////////////////////////
  // SharedPreferences储存
  static Future<void> savePrefs(String key, dynamic value) async {
    // _prefs?.setString(key, value);
  }

  static dynamic readPrefs(String key) {
    // return _prefs?.get(key);
  }

  static Future<void> removePrefs(String key) async {
    // await _prefs?.remove(key);
  }

  static Future<void> clearPrefs() async {
    // await _prefs?.clear();
  }

  ///////////////////////////////////////////////////////////////
  //钥匙串永久储存 android使用注意： In [project]/android/app/build.gradle set minSdkVersion to >= 18.
  static Future<void> putKeychain(String key, dynamic value) async {
    // await FlutterKeychain.put(key: key, value: value);
  }

  static dynamic getKeychain(String key) {
    // return FlutterKeychain.get(key: key);
  }

  static Future<void> removeKeychain(String key) async {
    // await FlutterKeychain.remove(key: key);
  }

  static Future<void> clearKeychain() async {
    // await FlutterKeychain.clear();
  }
///////////////////////////////////////////////////////////////
}
