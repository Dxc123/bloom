import 'dart:io';
import 'dart:isolate';

import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../bl_api/bl_https.dart';
import '../bl_untils/bl_loading.dart';


typedef UpLoadMediaCallBack = Function(BlChooseImageUtil upLoader, UploadMediaType type, String? url, String? partPath);

enum UploadMediaType { cancel, begin, success, failed }

class BlChooseImageUtil {
  final UpLoadMediaCallBack callBack;

  // type 0头像，1图片，2声音
  final int type;

  BlChooseImageUtil({required this.type, required this.callBack});

  void openChooseDialog() {
    Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [BoxShadow(color: Color(0x45000000), blurRadius: 29)],
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(25),
                  topEnd: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsetsDirectional.only(top: 10, bottom: 15),
                      child: Center(
                        child: Container(
                          width: 42,
                          height: 6,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9F9F9),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      Get.back();
                      // cameraChoose?.call();
                      // imagePickerCallBack.call(image);
                      goChooseImage(true);
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsetsDirectional.only(top: 20, bottom: 10),
                      child: const Text(
                        "Take photos",
                        style: TextStyle(
                          color: Color(0xFF1D0147),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      // albumChoose?.call();
                      Get.back();
                      // imagePickerCallBack.call(image);
                      goChooseImage(false);
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsetsDirectional.only(top: 10, bottom: 20),
                      child: const Text(
                        "Album",
                        style: TextStyle(
                          color: Color(0xFF1D0147),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFF9F9F9),
                    height: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(top: 5),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Color(0xFFA19AAB),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
      barrierColor: Colors.black38,
    );
  }

  void goChooseImage(bool camera) {
    // XFile? image
    ImagePicker().pickImage(source: camera ? ImageSource.camera : ImageSource.gallery, maxWidth: 1080, maxHeight: 1080).then((value) {
      if (value != null) {
        loadOssAndUpload(value.path);
        callBack.call(this, UploadMediaType.begin, null, value.path);
      } else {
        callBack.call(this, UploadMediaType.failed, null, null);
      }
    });
  }

  // type 0头像，1图片，2声音
  void loadOssAndUpload(String path) {
    BlHttpUtil().post<String>(BlHttpUrls.s3UploadUrl, data: {'endType': '.jpg'}, errCallback: (err) {
      BlLogger.debug("err = $err");
      BlLoading.toast(err.message);
      callBack.call(this, UploadMediaType.failed, null, null);
    }, showLoading: true).then((url) {
      uploadWithFilePath(path, url);
    });
  }

// type 0头像，1图片，2声音
  void uploadWithFilePath(String filePath, String url) async {
    // ShowLoading("");

    try {
      // File file = File(filePath);
      // String? endPoint = ossConfig.endpoint?.replaceFirst("http://", "");
      // endPoint = endPoint?.replaceFirst("https://", "");
      //
      // String path = (ossConfig.path ?? "") + (type == 0 ? "/media" : "/chat");
      //
      // OSSObject ossObject = type == 2
      //     ? OSSAudioObject.fromFile(file: file)
      //     : OSSImageObject.fromFile(file: file);
      // // 初始化OSSClient
      // OSSClient.init(
      //   endpoint: endPoint ?? "oss-cn-hongkong.aliyuncs.com",
      //   bucket: ossConfig.bucket ?? "yesme-public",
      //   credentials: () {
      //     return Future.value(Credentials(
      //         accessKeyId: ossConfig.key ?? "",
      //         accessKeySecret: ossConfig.secret ?? "",
      //         securityToken: ossConfig.token ?? "",
      //         expiration:
      //             DateTime.fromMillisecondsSinceEpoch(ossConfig.expire ?? 0)));
      //   },
      // );
      // OSSObject object = await OSSClient().putObject(
      //     object: ossObject,
      //     // endpoint: LocalStore.ossConfig?.endpoint ?? "",
      //     // bucket: LocalStore.ossConfig?.bucket ?? "",
      //     endpoint: endPoint ?? "oss-cn-hongkong.aliyuncs.com",
      //     bucket: ossConfig.bucket ?? "yesme-public",
      //     path: path);
      TrUploadIsolateUntil().loadData(url, filePath, 'image/jpeg').then((value) {
        if (value == 200) {
          var realUrl = url.split('?')[0];
          BlLogger.debug("图片上传成功 URL= $realUrl");
          callBack.call(this, UploadMediaType.success, realUrl, filePath);
        } else {
          callBack.call(this, UploadMediaType.failed, null, null);
        }
      }).catchError((e) {
        callBack.call(this, UploadMediaType.failed, null, null);
      });

      // if (object.url.isNotEmpty) {
      //   final String partPath = object.url.split(endPoint ?? "").last;
      //   callBack.call(this, AppUploadType.success, object.url, partPath);
      // } else {
      //   callBack.call(this, AppUploadType.failed, null, null);
      // }
    } catch (e) {
      BlLogger.debug("e = $e");
      // showToast(LangMap.cbl_err_unknown.tr);
      callBack.call(this, UploadMediaType.failed, null, null);
    } finally {
      // CbldeLoding();
    }
  }
}


class TrUploadIsolateUntil {
  Future<int> loadData(String url, String localPath, String contentType) async {
    // 通过spawn新建一个isolate，并绑定静态方法
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    // 获取新isolate的监听port
    SendPort sendPort = await receivePort.first;
    // 调用sendReceive自定义方法
    int dataList = await sendReceive(sendPort, url, localPath, contentType);
    print('dataList $dataList');
    return dataList;
  }

// isolate的绑定方法
  static dataLoader(SendPort sendPort) async {
    // 创建监听port，并将sendPort传给外界用来调用
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    // 监听外界调用
    await for (var msg in receivePort) {
      SendPort callbackPort = msg[0];
      String requestURL = msg[1];
      String localPath = msg[2];
      String contentType = msg[3];

      // 初始化一个Http客户端，并加入自定义Header
      var req = await HttpClient().putUrl(Uri.parse(requestURL));
      // headers.forEach((key, value) {
      //   req.headers.add(key, value);
      // });
      req.headers.add('Content-Type', contentType);
      req.headers.add('Accept', '*/*');
      req.headers.add('Connection', 'keep-alive');
      // 读文件
      req.bufferOutput = true;
      var file = File(localPath);
      var s = await file.open();
      var x = 0;
      var size = file.lengthSync();
      req.headers.add('Content-Length', size.toString());
      var chunkSize = 65536;
      while (x < size) {
        var len = size - x >= chunkSize ? chunkSize : size - x;
        var val = s.readSync(len).toList();
        x = x + len;
        // 处理数据块
        // val = proc(val);
        // 加入http发送缓冲区
        req.add(val);
        // 立即发送并清空缓冲区
        // await req.flush();
        // req.write(val);
        await req.flush();
      }
      await s.close();

      // 文件发送完成
      await req.close();
      // 获取返回数据
      final response = await req.done;
      // 其它处理逻辑
      if (kDebugMode) {
        print("response statusCode: ${response.statusCode}");
      }
      // return response.statusCode;
      // 回调返回值给调用者
      callbackPort.send(response.statusCode);
    }
  }

// 创建自己的监听port，并且向新isolate发送消息
  Future sendReceive(SendPort sendPort, String url, String localPath, String contentType) {
    ReceivePort receivePort = ReceivePort();
    sendPort.send([receivePort.sendPort, url, localPath, contentType]);
    // 接收到返回值，返回给调用者
    return receivePort.first;
  }
}