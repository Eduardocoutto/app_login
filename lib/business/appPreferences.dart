import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  String userLogin = "";
  String lastToken = "";

  static Future<AppPreferences> getPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    AppPreferences appPref = AppPreferences();
    appPref.userLogin = preferences.getString(AppPrefAttribute.UserLogin);
    appPref.lastToken = preferences.getString(AppPrefAttribute.LastToken);

    return appPref;
  }

  static setAttribute(String appPrefAttribute, Object attribute) async {
    bool isNull = attribute == null;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    switch (attribute.runtimeType) {
      case int:
        await preferences.setInt(appPrefAttribute, isNull ? "" : attribute);
        break;
      case String:
        await preferences.setString(appPrefAttribute, isNull ? "" : attribute);
        break;
      case bool:
        await preferences.setBool(appPrefAttribute, isNull ? "" : attribute);
        break;
      case Double:
        await preferences.setDouble(appPrefAttribute, isNull ? "" : attribute);
        break;
      default:
        break;
    }
  }
}

class AppPrefAttribute {
  static const UserLogin = "USER_LOGIN";
  static const LastToken = "LAST_TOKEN";
}
