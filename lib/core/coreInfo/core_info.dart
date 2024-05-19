import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../commonWidget/show_loading.dart';
import '../../main.dart';
import '../baseRepo/bearer_token_repo.dart';
import '../helper/navigation_helper.dart';

class CoreInfo {
  static BearerTokenRepo bearerTokenRepo = BearerTokenRepo();

  static Future<void> init() async {}

  static Future<void> getWhenLogged() async {}

  static bool isLogged() {
    return Hive.box("user").containsKey("bearerToken");
  }

  static Future<void> logout() async {
    showLoading();
    await Hive.box("user").clear();
    // call api
    hideLoading();
    // NavigationHelper.pushUntil(
    //     navigatorKey.currentContext!, const LoginInPageView());
  }

  static Future<void> deleteAccount() async {}
}
