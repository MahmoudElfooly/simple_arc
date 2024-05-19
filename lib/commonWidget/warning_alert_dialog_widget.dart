import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/constants/constant_colors.dart';
import 'general_button.dart';
import 'general_text.dart';

class WarningAlertDialogWidget extends StatelessWidget {
  final String title;
  final String? cancelBtnName;
  final String body;
  final Widget? button;
  final Widget? content;

  const WarningAlertDialogWidget(
      {Key? key,
      required this.title,
      this.cancelBtnName,
      required this.body,
      this.button,
      this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        title,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GeneralText(
              text: body,
              color: kFontSecondaryColor,
            ),
            content ?? const SizedBox(),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        GeneralButton(
          text: cancelBtnName ?? "cancel".tr(),
          onPressed: () => Navigator.pop(context),
          width: 110,
          borderColor: kFontSecondaryColor,
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
        if (button != null) button!,
      ],
    );
  }
}
