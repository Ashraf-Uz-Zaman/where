import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static final SIGN_IN = "SIGN_IN";
  static final memberId = "memberId";
  static final memberFirstName = "memberFirstName";
  static final memberLastName = "memberLastName";
  static final memberType = "memberType";
  static final venueId = "venueId";
  static final venueName = "venueName";
  static final address = "address";
  static final token = "token";

  Future<void> putBool(String key, bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool(key, val);
  }

  Future<void> putInt(String key, int val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setInt(key, val);
  }

  Future<void> putString(String key, String val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString(key, val);
  }

  Future<bool> getBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(key) ?? false;
  }

  Future<int> getInt(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getInt(key) ?? -1;
  }
}
