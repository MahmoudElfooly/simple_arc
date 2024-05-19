import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'general_button.dart';

showConfirmationDialogue(String message, Widget button,
    {bool showCancel = true}) {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) => ConfirmationAlertDialogueWidget(
        title: message, button: button, showCancel: showCancel),
  );
}

class ConfirmationAlertDialogueWidget extends StatelessWidget {
  final String title;
  final Widget button;
  final bool showCancel;
  const ConfirmationAlertDialogueWidget(
      {super.key,
      required this.title,
      required this.button,
      this.showCancel = true});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF282F37),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        if (showCancel)
          GeneralButton(
            text: "cancel".tr(),
            onPressed: () => Navigator.pop(context),
            width: 110,
            borderColor: const Color(0xFF445462),
            textColor: Colors.white,
          ),
        button
      ],
    );
  }
}
