import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo {
  static setFirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("FirstTime", false);
  }

  static getFirstTime() async {
    setFirstTime();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getBool("FirstTime");
  }
}
