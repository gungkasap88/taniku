import 'package:shared_preferences/shared_preferences.dart';

class shared_pref_service{
  // note: save shared pref
  void setStringSharedPref(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // note: get shared pref
  Future<String> getStringSharedPref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value.toString();
  }

  // note: remove shared pref
  Future removeSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('removed');
    prefs.clear();
  }
}