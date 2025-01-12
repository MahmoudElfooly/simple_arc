import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../commonWidget/general_button.dart';
import '../../main.dart';

showErrorDialogue(String error) {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) => ErrorAlertDialogueWidget(
      title: error,
    ),
  );
}

class ErrorAlertDialogueWidget extends StatelessWidget {
  final String title;
  const ErrorAlertDialogueWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF282F37),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        GeneralButton(
            text: "ok".tr(),
            onPressed: () => Navigator.pop(context),
            width: 110,
            borderColor: Colors.white)
      ],
    );
  }
}
