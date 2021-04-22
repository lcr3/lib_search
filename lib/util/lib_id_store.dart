import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LibIdStore {
  static const _saveKey = 'lib_id_save_key';

    Future<List<String>> get() async {
      final pref = await SharedPreferences.getInstance();
      final list = pref.getStringList(_saveKey);
      if (list == null) {
        return [];
      }
      return list;
    }

  Future<bool> store(List<String> ids) async {
    final pref = await SharedPreferences.getInstance();
    final list = pref.setStringList(_saveKey, ids);
    return list;
  }
}