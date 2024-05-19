import 'package:hive_flutter/hive_flutter.dart';

class BearerTokenRepo{
  String? getBearerToken() {
    return Hive.box('user').get('bearerToken');
  }

  Future<void> setBearerToken(String token) async {
    Hive.box("user").put('bearerToken', token);
  }

  Future<void> deleteBearerToken() async {
    Hive.box("user").delete('bearerToken');
  }
}