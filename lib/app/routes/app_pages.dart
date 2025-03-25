import 'package:get/get.dart';

import '../modules/bl_discover/bindings/bl_discover_binding.dart';
import '../modules/bl_discover/views/bl_discover_view.dart';
import '../modules/bl_discover_detail/bindings/bl_discover_detail_binding.dart';
import '../modules/bl_discover_detail/views/bl_discover_detail_view.dart';
import '../modules/bl_home/bindings/bl_home_binding.dart';
import '../modules/bl_home/views/bl_home_view.dart';
import '../modules/bl_home_detail/bindings/bl_home_detail_binding.dart';
import '../modules/bl_home_detail/views/bl_home_detail_view.dart';
import '../modules/bl_login/bindings/bl_login_binding.dart';
import '../modules/bl_login/views/bl_login_view.dart';
import '../modules/bl_main/bindings/bl_main_binding.dart';
import '../modules/bl_main/views/bl_main_view.dart';
import '../modules/bl_me/bindings/bl_me_binding.dart';
import '../modules/bl_me/children/bl_me_about_us/bindings/bl_me_about_us_binding.dart';
import '../modules/bl_me/children/bl_me_about_us/views/bl_me_about_us_view.dart';
import '../modules/bl_me/children/bl_me_black_list/bindings/bl_me_black_list_binding.dart';
import '../modules/bl_me/children/bl_me_black_list/views/bl_me_black_list_view.dart';
import '../modules/bl_me/children/bl_me_edit/bindings/bl_me_edit_binding.dart';
import '../modules/bl_me/children/bl_me_edit/views/bl_me_edit_view.dart';
import '../modules/bl_me/children/bl_me_feedback/bindings/bl_me_feedback_binding.dart';
import '../modules/bl_me/children/bl_me_feedback/views/bl_me_feedback_view.dart';
import '../modules/bl_me/children/bl_me_media_black_list/bindings/bl_me_media_black_list_binding.dart';
import '../modules/bl_me/children/bl_me_media_black_list/views/bl_me_media_black_list_view.dart';
import '../modules/bl_me/children/bl_me_my_collection_list/bindings/bl_me_my_collection_list_binding.dart';
import '../modules/bl_me/children/bl_me_my_collection_list/views/bl_me_my_collection_list_view.dart';
import '../modules/bl_me/children/bl_me_my_focus_list/bindings/bl_me_my_focus_list_binding.dart';
import '../modules/bl_me/children/bl_me_my_focus_list/views/bl_me_my_focus_list_view.dart';
import '../modules/bl_me/children/bl_me_my_like_list/bindings/bl_me_my_like_list_binding.dart';
import '../modules/bl_me/children/bl_me_my_like_list/views/bl_me_my_like_list_view.dart';
import '../modules/bl_me/children/bl_me_my_publish/bindings/bl_me_my_publish_binding.dart';
import '../modules/bl_me/children/bl_me_my_publish/views/bl_me_my_publish_view.dart';
import '../modules/bl_me/children/bl_me_recharge/bindings/bl_me_recharge_binding.dart';
import '../modules/bl_me/children/bl_me_recharge/views/bl_me_recharge_view.dart';
import '../modules/bl_me/children/bl_me_setting/bindings/bl_me_setting_binding.dart';
import '../modules/bl_me/children/bl_me_setting/views/bl_me_setting_view.dart';
import '../modules/bl_me/views/bl_me_view.dart';
import '../modules/bl_message/bl_chat/bindings/bl_chat_binding.dart';
import '../modules/bl_message/bl_chat/views/bl_chat_view.dart';
import '../modules/bl_message/bl_conversation/bindings/bl_conversation_binding.dart';
import '../modules/bl_message/bl_conversation/views/bl_conversation_view.dart';
import '../modules/bl_publish/bindings/bl_publish_binding.dart';
import '../modules/bl_publish/views/bl_publish_view.dart';
import '../modules/bl_splash/bindings/bl_splash_binding.dart';
import '../modules/bl_splash/views/bl_splash_view.dart';
import '../modules/bl_web_view/bindings/bl_web_view_binding.dart';
import '../modules/bl_web_view/views/bl_web_view_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BL_SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.BL_HOME,
      page: () => const BlHomeView(),
      binding: BlHomeBinding(),
    ),
    GetPage(
      name: _Paths.BL_HOME_DETAIL,
      page: () => const BlHomeDetailView(),
      binding: BlHomeDetailBinding(),
    ),
    GetPage(
      name: _Paths.BL_DISCOVER,
      page: () => const BlDiscoverView(),
      binding: BlDiscoverBinding(),
    ),
    GetPage(
      name: _Paths.BL_DISCOVER_DETAIL,
      page: () => const BlDiscoverDetailView(),
      binding: BlDiscoverDetailBinding(),
    ),
    GetPage(
      name: _Paths.BL_PUBLISH,
      page: () => const BlPublishView(),
      binding: BlPublishBinding(),
    ),
    GetPage(
      name: _Paths.BL_CONVERSATION,
      page: () => const BlConversationView(),
      binding: BlConversationBinding(),
    ),
    GetPage(
      name: _Paths.BL_CHAT,
      page: () => const BlChatView(),
      binding: BlChatBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME,
      page: () => const BlMeView(),
      binding: BlMeBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME_SETTING,
      page: () => const BlMeSettingView(),
      binding: BlMeSettingBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME_ABOUT_US,
      page: () => const BlMeAboutUsView(),
      binding: BlMeAboutUsBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME_BLACK_LIST,
      page: () => const BlMeBlackListView(),
      binding: BlMeBlackListBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME_MY_PUBLISH,
      page: () => const BlMeMyPublishView(),
      binding: BlMeMyPublishBinding(),
      children: [
        GetPage(
          name: _Paths.BL_ME_MY_PUBLISH,
          page: () => const BlMeMyPublishView(),
          binding: BlMeMyPublishBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.BL_ME_MY_COLLECTION_LIST,
      page: () => const BlMeMyCollectionListView(),
      binding: BlMeMyCollectionListBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME_MY_LIKE_LIST,
      page: () => const BlMeMyLikeListView(),
      binding: BlMeMyLikeListBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME_MY_FOCUS_LIST,
      page: () => const BlMeMyFocusListView(),
      binding: BlMeMyFocusListBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME_FEEDBACK,
      page: () => const BlMeFeedbackView(),
      binding: BlMeFeedbackBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME_EDIT,
      page: () => const BlMeEditView(),
      binding: BlMeEditBinding(),
    ),
    GetPage(
      name: _Paths.BL_SPLASH,
      page: () => const BlSplashView(),
      binding: BlSplashBinding(),
    ),
    GetPage(
      name: _Paths.BL_LOGIN,
      page: () => const BlLoginView(),
      binding: BlLoginBinding(),
    ),
    GetPage(
      name: _Paths.BL_MAIN,
      page: () => const BlMainView(),
      binding: BlMainBinding(),
    ),
    GetPage(
      name: _Paths.BL_WEB_VIEW,
      page: () => const BlWebViewView(),
      binding: BlWebViewBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME_RECHARGE,
      page: () => const BlMeRechargeView(),
      binding: BlMeRechargeBinding(),
    ),
    GetPage(
      name: _Paths.BL_ME_MEDIA_BLACK_LIST,
      page: () => const BlMeMediaBlackListView(),
      binding: BlMeMediaBlackListBinding(),
    ),
  ];
}
