import 'package:bloom/app/data/bl_untils/bl_logger.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../data/bl_untils/bl_loading.dart';


class AppLoginData {
  bool success = false;
  String? token;
  String id = '';
  String? nickname;
  String? cover;
  String? email;
}

class AppLoginUtil {
  GoogleSignIn? _googleSign;

  void googleSignIn(Function(AppLoginData) callback) async {
    var loginData = AppLoginData();
    _googleSign ??= GoogleSignIn();
    try {
      final isSigned = await _googleSign!.isSignedIn();
      if (isSigned) {
        await _googleSign!.signOut();
      }
      final result = await _googleSign!.signIn();
      final googleAuth = await result?.authentication;

      if (result?.id == null) {
        BlLoading.toast("Operation failed, please try again.");
        callback.call(loginData);
      } else {
        loginData.success = true;
        loginData.token = googleAuth!.accessToken;
        loginData.id = result!.id;
        loginData.nickname = result.displayName;
        loginData.cover = result.photoUrl;
        loginData.email = result.email;
        callback.call(loginData);
      }
    } catch (error) {
      BlLoading.toast("Operation failed, please try again.");
      callback.call(loginData);
    }
  }

  // void facebookSignIn(Function(AppLoginData) callback) async {
  //   var loginData = AppLoginData();
  //   final LoginResult result = await FacebookAuth.instance.login(
  //     permissions: ['public_profile'],
  //   );
  //
  //   switch (result.status) {
  //     case LoginStatus.success:
  //       {
  //         if (result.accessToken?.tokenString == null) {
  //           BlLoading.toast("Operation failed, please try again.");
  //           callback.call(loginData);
  //         } else {
  //           loginData.success = true;
  //           loginData.token = result.accessToken?.tokenString;
  //           callback.call(loginData);
  //         }
  //       }
  //       break;
  //     case LoginStatus.cancelled:
  //       {
  //         // BotToast.showText(text: "授权取消");
  //         callback.call(loginData);
  //       }
  //       break;
  //     default:
  //       {
  //         BlLoading.toast("Operation failed, please try again.");
  //         callback.call(loginData);
  //       }
  //       break;
  //   }
  // }

  void appleSignIn(Function(AppLoginData) callback) async {
    var loginData = AppLoginData();
    try {
      final credential = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);
      BlLogger.debug("credential = $credential");
      String name = (credential.givenName) ?? credential.familyName ?? "";
      loginData.nickname = name;
      loginData.token = credential.identityToken;
      loginData.success = true;
      callback.call(loginData);
    } catch (e) {
      BlLogger.debug("e= $e");
      if (e is SignInWithAppleAuthorizationException) {
        switch (e.code) {
          case AuthorizationErrorCode.canceled:
            {}
            break;
          default:
            {
              BlLoading.toast("Operation failed, please try again.");
            }
            break;
        }
      }
      callback.call(loginData);
    }
  }
}
