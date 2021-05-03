import 'dart:convert';
import 'package:lib_search_app/network/entity/library.dart';
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

  Future<void> saveList(List<Library> libs) async {
    for (final lib in libs) {
      await saveLibraryObject(lib);
    }
  }

  Future<void> saveLibraryObject(Library library) async {
    final key = library.systemId;
    final pref = await SharedPreferences.getInstance();
    await pref.setString('$key', library.systemId);
    await pref.setString('$key:pref', library.pref);
    await pref.setString('$key:libId', library.libId);
    await pref.setString('$key:category', library.category);
    await pref.setString('$key:formal', library.formal);
  }

  Future<Library?> getLibrary(String systemId) async {
    final pref = await SharedPreferences.getInstance();
    final savedSystemId = await pref.getString('$systemId');
    final pre = await pref.getString('$systemId:pref');
    final libId = await pref.getString('$systemId:libId');
    final formal = await pref.getString('$systemId:formal');
    final category = await pref.getString('$systemId:category');
    if (savedSystemId != null &&
        pre != null &&
        category != null &&
        libId != null &&
        formal != null) {
      return Library(category, pre, libId, savedSystemId, formal);
    }
    return null;
  }
}