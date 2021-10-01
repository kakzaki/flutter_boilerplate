import 'dart:async';
import 'package:appname/src/models/user.dart';
import 'package:hive/hive.dart';

class DBHelper {
  static Box? _db;

  Future get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Box theDb = await Hive.openBox('app_name_database');
    return theDb;
  }

  void onDelete() async {
    await Hive.deleteBoxFromDisk('app_name_database');
  }

  void saveUser(User user) async {
    Box dbClient = await db;
    dbClient.put('User', user);
  }

  void deleteUser() async {
    Box dbClient = await db;
    dbClient.delete('User');
  }

  Future<User> getUser() async {
    Box dbClient = await db;
    User user = dbClient.get('User');
    return user;
  }
}
