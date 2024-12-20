import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage _secureStorage;
  // final logger = getLogger();

  StorageService() : _secureStorage = FlutterSecureStorage();

  Future<String?> getValue(String key, [String? ifnull]) async {
    try {
      var value = await _secureStorage.read(key: key);
      return value ?? ifnull ?? value;
    } catch (e) {
      return ifnull;
    }
  }

  FutureOr<void> setValue(String key, String? value) {
    try {
      _secureStorage.write(key: key, value: value);
    } catch (e) {}
  }
}

abstract class StorageKeys {
  static const String onboarded = 'onboarded';
  static const String themeMode = "themeMode";
}
