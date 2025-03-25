import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio/src/response.dart' as dio_response;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide FormData;
import 'package:pointycastle/asymmetric/api.dart';

import '../../../app/routes/app_pages.dart';
import '../../../generated/json/base/json_convert_content.dart';
import '../bl_common/bl_constants.dart';
import '../bl_service/bl_device_Info_service.dart';
import '../bl_service/bl_my_info_service.dart';
import '../bl_untils/bl_loading.dart';
import 'bl_ency_tool.dart';

class BlHttpUrls {
  // 获取app配置接口
  static const String configApi = "/app/config";
// //  获取app配置密文接口
//   static const String configApiV2 = "/app/configV2";
  // facebook登录
  static const String facebookLoginApi = "/login/facebook";
  // google登录
  static const String googleLoginApi = "/login/google";
  //判断谷歌账户是否绑定app账户
  static String checkBindGoogleAccount = "/user/checkBindGoogleAccount";
  //判断客户端缓存的登录数据
  static String checkCacheAccount = "/user/checkCacheAccount";

  // apple登录
  static const String appleLoginApi = "/login/apple";

  //游客
  static const String visitorLoginApi = "/app/register";

  // 账号登录
  static const String accountLogin = "/login/userLogin";

  // 退出登录
  static const String loginOutApi = "/login/userLogout";
  //注销账号
  static const String deleteAccount = "/user/deleteUser";

  // 更新用户详情
  static const String updateUserInfoApi = "/user/updateUserDetails";

  //用户信息
  static const String userInfoApi = "/user/getUserDetails";

  //获取翻译文案
  static const String getTransationsApi = "/app/loadTranslateConfig/0";

  //获取加密翻译文案
  static const String getTransationsV2Api = "/app/loadTranslateConfigV2/0";

  static const String noLongerReminds = "/call/noLongerReminds";

  // 获取s3上传url
  static const String s3UploadUrl = "/user/s3/storage/upload/pre-signed";
  //  网络获取AIHelp地址
  static const String getAiHelp = "/robot/getAiHelp";

  // 获取礼物列表，不包含vip专属
  static const String giftListApi = "/gift/getList";

  // 获取礼物列表，包含vip专属
  static const String allGiftListApi = "/gift/allList";
  //获取游戏中奖的礼物列表
  static const String gameGiftApi = "/prop/getGiftCards";

  // 获取vip专属礼物
  static const String vipGiftListApi = "/gift/vipList";
  static const String giftGetOne = "/gift/getOne/";
  //送礼 新包（废弃）
  // static const String sendGiftApi = "/gift/send";
  // （正常发送礼物使用）
  static const String sendGiftApiNew = "/gift/sendReal";
  //接入游戏才用 （只有在背包里送礼才用这个）
  static const String sendGiftPackageApi = "/gift/sendPackage";

  //折扣商品 新 type: 1.快捷充值，2.充值中心  3.vip商品,4.首页优惠充值：限时vip+最多2个普通vip+折扣+最多3个普通 5.靓号商品
  // 传1的时候返回discountProduct和运营指定的3个normalProducts
  // 传2的时候返回discountProduct和所有的normalProducts
  // 传3的时候只返回vipProducts
  // 传4的时候返回discountVip+排在首位的2个vipProducts+discountProduct+运营指定的3个normalProducts
  // 传5的时候返回prettyProducts
  // static const String getCompositeProduct = "/channelpay/getCompositeProduct/";
  static const String getCompositeProduct = "/p/getCompositeProduct/";

  //创建订单
  static const String createOrderApi = "/order/createOrder/v2";

  //苹果订单回调
  static const String appleNotifyApi = "/notify/iap/notify";

  //上传成功订单日志
  static const String uploadLogApi = "/app/aol/upload/log";

  //从服务器获取对应订单的支付状态
  static const String getOrderStatusApi = "/order/getOrderStatus";
}

class BlHttpUtil {
  static final BlHttpUtil _instance = BlHttpUtil._internal();
  factory BlHttpUtil() => _instance;

  late Dio _dio;
  // 取消请求token
  final CancelToken _cancelToken = CancelToken();
  static int timeDiff = 0;

  BlHttpUtil._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      // 请求基地址,可以包含子路径
      baseUrl: "",
      // baseUrl: storage.read(key: STORAGE_KEY_APIURL) ?? SERVICE_API_BASEURL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: Duration(milliseconds: 20*1000),
      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: Duration(milliseconds: 10*000),
      // Http请求头.
      headers: {},

      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: 'application/json; charset=utf-8',

      /// [responseType] 表示期望以那种格式(方式)接受响应数据。
      /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
      ///
      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      ///
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,
    );
    _dio = Dio(options);
    // CERTIFICATE_VERIFY_FAILED: certificate has expired(handshake.cc:393)) 在有手机有这个错误
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) {
        return true;
      };
      return null;
    };
    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        String userAgent = "${BlConstants.appNameLower},${BlDeviceInfoService.to.version},${BlDeviceInfoService.to.deviceModel},${BlDeviceInfoService.to.appSystemVersionKey},${BlConstants.channelName},${BlDeviceInfoService.to.buildNumber}";
        options.headers["User-Agent"] = _zipStr(userAgent);
        options.headers["Authorization"] = AppMyInfoService.to.authorization ?? "";
        options.headers["user-language"] = Get.deviceLocale?.languageCode ?? "en";
        options.headers["device-id"] = BlDeviceInfoService.to.deviceIdentifier;
        options.headers["time-difference"] = timeDiff.toString();
        // //TEST DATA
        // if (kDebugMode == true) {
        //   BlLogger.debug("接口调用headers = ${options.headers}");
        // }
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        if (response.statusCode == 200) {
          // 后台系统的时间
          int timestamp = int.parse(response.headers.value("timestamp") ?? "0");
          // 手机系统的时间
          int now = DateTime.now().millisecondsSinceEpoch;
          // 计算差值，用于下次请求计算
          timeDiff = timestamp == 0 ? 0 : timestamp - now;

          response.data = _unZipStr(response.data);
        }
        // Do something with response data
        return handler.next(response); // continue
        // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioException`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onError: (DioException e, handler) {
        BlLogger.debug("接口调用失败 = ${e.error}");
        //TEST DATA
        if (kDebugMode == true) {
          String para = BlSafeEncryptUtils.decodeEncryptPara(e.requestOptions.data);
          BlLogger.debug("接口调用失败,请求参数para=$para");
        }

        BlLoading.dismiss();
        AppErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
        return handler.next(e); //continue
      },
    ));

    // 日志
    // _dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: false,
    //     requestBody: true,
    //     responseHeader: false,
    //     responseBody: true));
  }

  /*
   * error统一处理
   */

  // 错误处理
  void onError(AppErrorEntity eInfo) {
    BlLogger.debugDio('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
    // BlLoading.toast("[${eInfo.code.toString()}]${eInfo.message}");
    switch (eInfo.code) {
      case 401:
      // UserStore.to.onLogout();
      // EasyLoading.showError(eInfo.message);
        break;
      default:
      // EasyLoading.showError('未知错误');
        break;
    }
  }

  // 错误信息
  AppErrorEntity createErrorEntity(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return AppErrorEntity(code: -1, message: "DioExceptionType.cancel");
      case DioExceptionType.connectionTimeout:
        return AppErrorEntity(code: -1, message: "DioExceptionType.connectTimeout");
      case DioExceptionType.sendTimeout:
        return AppErrorEntity(code: -1, message: "DioExceptionType.sendTimeout");
      case DioExceptionType.receiveTimeout:
        return AppErrorEntity(code: -1, message: "DioExceptionType.receiveTimeout");
      case DioExceptionType.badResponse:
        {
          try {
            int errCode = error.response != null ? error.response!.statusCode! : -1;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
              case 401:
              case 403:
              case 404:
              case 405:
              case 500:
              case 502:
              case 503:
              case 505:
                return AppErrorEntity(code: errCode, message: "net err");
              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  return AppErrorEntity(
                    code: errCode,
                    message: error.response != null ? error.response!.statusMessage! : "",
                  );
                }
            }
          } on Exception catch (_) {
            return AppErrorEntity(code: -1, message: "unknown err");
          }
        }
      default:
        {
          return AppErrorEntity(code: -1, message: error.message ?? "");
        }
    }
  }

  /// 加密
  static dynamic _encryptAes(String content) {
    var key = AppMyInfoService.to.config?.publicKey ?? "";
    if (key.isEmpty) {
      return content;
    }
    // BlLogger.debugDio("encryptAes start");
    var aesKey = "${'-----BEGIN PUBLIC KEY-----\n$key'}\n-----END PUBLIC KEY-----";

    var aesPublicKey = RSAKeyParser().parse(aesKey) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: aesPublicKey));

    List<int> sourceBytes = utf8.encode(content);
    int inputLen = sourceBytes.length;
    int maxLen = 117;
    List<int> totalBytes = [];
    for (var i = 0; i < inputLen; i += maxLen) {
      int endLen = inputLen - i;
      List<int> item;
      if (endLen > maxLen) {
        item = sourceBytes.sublist(i, i + maxLen);
      } else {
        item = sourceBytes.sublist(i, i + endLen);
      }
      totalBytes.addAll(encrypter.encryptBytes(item).bytes);
    }
    return base64.encode(totalBytes);
  }

  /// 压缩字符串
  String _zipStr(String str) {
    return base64Encode(zlib.encode(utf8.encode(str)));
  }

  /// 解压字符串
  String _unZipStr(String str) {
    var decodeString = base64Decode(str);
    var zlibdecode = zlib.decode(decodeString);
    return utf8.decode(zlibdecode);
  }

  /// 取消网络请求
  ///如果当我们的页面在发送请求时，用户主动退出当前界面或者app应用程序退出的时候数据还没有响应，
  ///那我们就需要取消该网络请求，防止不必要的错误
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  /// 读取本地配置
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    // if (Get.isRegistered<UserStore>() && UserStore.to.hasToken == true) {
    //   headers['Authorization'] = 'Bearer ${UserStore.to.token}';
    // }
    return headers;
  }

  /// restful post 操作
  Future<T> post<T>(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        Function(AppErrorEntity err)? errCallback,
        Function(bool hasNext)? pageCallback,
        Function(bool success, String msg)? doneCallback,
        Function()? nullCallback,
        bool showLoading = false,
        bool? getBaseEntity,
      }) async {
    //配置请求头
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    // BlLogger.debugDio('$path， begin');
    // 请求参数
    var paraFinal = {
      "method": path,
      "timestamp": DateTime.now().millisecondsSinceEpoch + timeDiff,
      "nonceStr": DateTime.now().microsecondsSinceEpoch,
    };
    if (data != null) {
      paraFinal["param"] = data;
    }
    // BlLogger.debug("请求api:${path} \n请求的参数= ${paraFinal}");
    // 请求前压缩保留 加密去掉
    var paraFinalJson = const JsonEncoder().convert(paraFinal);
    var sendPara = _encryptAes(_zipStr(paraFinalJson));

    /// configApi接口和一般的接口不一样
    bool isGetLanguage = path == BlHttpUrls.getTransationsApi;
    bool isGetLanguageV2 = path == BlHttpUrls.getTransationsV2Api;
    bool isGetConfig = path == BlHttpUrls.configApi;
    final isSpecal = isGetConfig || isGetLanguage || isGetLanguageV2;
    final root = isSpecal ? BlConstants.getConfigBaseUrl() : BlConstants.getBaseUrl();
    _dio.options.baseUrl = root;
    BlLogger.debugDio('baseUrl = $root path = $path， Http post =  $json');

    /// 一般接口path这里就直接不传值了，path放参数里面去了！！！！
    dio_response.Response<String> response;
    if (showLoading) BlLoading.showLoading();
    // BlLogger.debugDio('$path， begin post');
    try {
      response = await _dio.post(
        isSpecal ? path : "",
        data: isSpecal ? null : sendPara,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: _cancelToken,
      );
    } catch (e) {
      BlLogger.debugDio("catch 错误 = $e");
      AppErrorEntity err;
      if (e is AppErrorEntity) {
        err = e;
      } else if (e is DioException) {
        err = AppErrorEntity(code: -4, message: e.message ?? "");
      } else {
        err = AppErrorEntity(code: -3, message: "try catch err");
      }
      if (errCallback == null) {
        BlLoading.toast(err.message);
      } else {
        errCallback.call(err);
      }
      doneCallback?.call(false, err.message);
      return Future.error(e);
    } finally {
      if (showLoading) BlLoading.dismiss();
      // BlLogger.debugDio('$path，post done');
    }
    // BlLogger.debug("response.data = ${response.data}");
    var baseEntity = const JsonDecoder().convert(response.data ?? '{}');

    /// 返回的data是null,这个会发生吗？
    if (baseEntity == null) {
      if (errCallback == null) {
        BlLoading.toast("baseEntity == null");
      } else {
        errCallback.call(AppErrorEntity(code: -3, message: "baseEntity == null"));
      }
      doneCallback?.call(false, "baseEntity == null");
      return Future.error("baseEntity err");
    }
    // BlLogger.longLog(path + '->' + const JsonEncoder().convert(baseEntity));

    /// 返回的data里面code不是0，需要处理
    var code = baseEntity["code"];
    if (code != 0) {
      if (errCallback == null) {
        if (code == 8) {
          BlLoading.toast("${baseEntity["message"]}");
        } else if (code == 2) {
          //token 过期
          AppMyInfoService.to.clear();
          Get.offAllNamed(Routes.BL_LOGIN);
          //TODO：合并代码后，放开注释
          // AppRtmManager.closeRtm();
          // AppSocketManager.to.breakenSocket();
        } else {
          BlLoading.toast("[$code] ${baseEntity["message"]}");
        }
      } else {
        errCallback.call(AppErrorEntity(code: code, message: baseEntity["message"]));
        if (code == 24 || code == 901) {
          //code == 24  //账号被封禁
          // code == 901 //设备被封禁
          AppMyInfoService.to.clear();
          Get.offAllNamed(Routes.BL_LOGIN);
          //TODO：合并代码后，放开注释
          // AppRtmManager.closeRtm();
          // AppSocketManager.to.breakenSocket();
        }
      }
      doneCallback?.call(false, "[$code] ${baseEntity["message"]}");
      return Future.error("baseEntity err");
    }

    /// 返回的分页数据
    if (baseEntity["page"] != null) {
      try {
        pageCallback?.call(baseEntity["page"]["hasNext"] == true);
      } catch (e) {
        BlLogger.debugDio("error = $e");
      }
    }
    doneCallback?.call(true, baseEntity["message"]);

    // 泛型用void,直接返回null
    if (T.toString() == 'void') {
      return null as T;
    }
    var serverData = baseEntity["data"];

    /// code=0而data=null的情况
    /// 为啥服务器有时code=0而data=[],有时code=0而data=null,真扯！？
    /// 这样的接口 .catchError((err) 判断err==0
    if (serverData == null) {
      nullCallback?.call();
      return Future.error(0);
    }

    /// code=0而data is String的情况，泛型用String
    // if (serverData is String){
    //   return serverData as T;
    // }
    /// code=0而data不是map和list,不用fromJson
    if (serverData is! Map<String, dynamic> && serverData is! List<dynamic>) {
      BlLogger.debugDio('need not JsonConvert');
      return serverData as T;
    }
    //data为 String类型的 list ,需要单独处理解析
    if (<String>[] is T && serverData is List) {
      return serverData.map((e) => e as String).toList() as T;
    }
    if (getBaseEntity == true) {
      BlLogger.debugDio('List<dynamic> need not JsonConvert');
      return JsonConvert.fromJsonAsT<T>(baseEntity)!;
    }
    return JsonConvert.fromJsonAsT<T>(serverData)!;
  }
}

// 异常处理
class AppErrorEntity implements Exception {
  int code = -1;
  String message = "";

  AppErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
