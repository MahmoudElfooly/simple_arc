import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/constants/constant_colors.dart';
import '../core/constants/constant_keywords.dart';
import 'general_text.dart';

class BlocTempWidget extends StatelessWidget {
  final Widget successWidget;
  final bool errorState;
  final bool loadingState;
  final Color? loadingColor;
  final Widget? loadingWidget;
  final bool? emptyState;
  final String? emptyTitle;
  final Widget? tapBar;

  const BlocTempWidget(
      {Key? key,
      required this.successWidget,
      required this.errorState,
      required this.loadingState,
      this.emptyState,
      this.emptyTitle,
      this.loadingWidget,
      this.loadingColor,
      this.tapBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loadingState) {
      return loadingWidget ??
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tapBar ?? const SizedBox(),
              Center(
                child: CircularProgressIndicator(
                  color: loadingColor ?? kPrimaryColor,
                ),
              ),
              const SizedBox(),
            ],
          );
    } else {
      return Column(
        mainAxisAlignment:
            (errorState || loadingState || (emptyState ?? false)) &&
                    tapBar != null
                ? MainAxisAlignment.spaceBetween
                : (errorState || loadingState || (emptyState ?? false)) &&
                        tapBar == null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
        // mainAxisSize: loadingState ? MainAxisSize.max : MainAxisSize.min,
        // mainAxisSize:  MainAxisSize.max ,
        children: [
          tapBar ?? const SizedBox(),
          if (errorState) ...[
            Center(
              child: GeneralText(
                text: kErrorText,
                size: 26,
                isBold: true,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(),
          ] else if (emptyState != null && emptyState!) ...[
            Center(
              child: GeneralText(
                text: "${"thereIsNo".tr()} ${emptyTitle!.toLowerCase()}",
                size: 26,
                isBold: true,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(),
          ] else
            successWidget,
        ],
      );
    }
  }
}
