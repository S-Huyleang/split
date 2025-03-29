import 'package:shared_preferences/shared_preferences.dart';

class LocalStorages {
  static const String key = '__HAS_LOGGED_IN__';

  /// Set the logged-in status
  static Future<void> setCurrentUser(String uid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, uid);
  }

  /// Get the logged-in status (returns false if not set)
  static Future<String?> getCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  /// Clear the logged-in status
  static Future<void> dispatchUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
