extension StringExtension on String {
  String upperCaseFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get last {
    return this[length - 1];
  }

  String get formatedNumber {
    return replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
  }
}