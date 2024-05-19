import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/constants/constant_colors.dart';
import '../core/helper/size_config.dart';
import '../main.dart';
import 'general_text.dart';

void showLoading({Color? loadingColor}) {
  showDialog<String>(
    barrierDismissible: false,
    context: navigatorKey.currentContext!,
    barrierColor: Colors.black38,
    builder: (BuildContext context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Center(
          child: Container(
              width: SizeConfig.screenWidth * 0.8,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: loadingColor ?? kPrimaryColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GeneralText(
                    text: "loadingData".tr(),
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              )),
        ),
      ),
    ),
  );
}

void hideLoading() => Navigator.pop(navigatorKey.currentContext!);
