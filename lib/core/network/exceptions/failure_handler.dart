import 'package:dartz/dartz.dart';

import '../../constants/constant_keywords.dart';
import '../../dialogs/error_alert_dialogue_widget.dart';
import 'failures.dart';

void failureHandler(
    Either<Failure, dynamic> result, void Function() onSuccess) {
  result.fold(
    (l) => showErrorDialogue(l.message ?? kErrorText),
    (r) => onSuccess(),
  );
}
