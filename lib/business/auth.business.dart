import 'package:teste_agape/business/appPreferences.dart';
import 'package:teste_agape/models/auth.model.dart' as authModel;
import 'package:teste_agape/models/authLogin.model.dart';
import 'package:teste_agape/services/auth.service.dart';

abstract class BaseAuth {
  Future signIn(String login, String password);
  Future<void> signOut();
}

class Auth implements BaseAuth {
  @override
  Future<bool> signIn(String login, String password) async {
    AuthLogin authLogin = new AuthLogin(login: login, password: password);

    AuthSevice authService = new AuthSevice();
    authModel.Auth auth = await authService.authLogin(authLogin);

    AppPreferences.setAttribute(AppPrefAttribute.UserLogin, login);
    AppPreferences.setAttribute(
        AppPrefAttribute.LastToken, (auth != null) ? auth.accessToken : "");
    if (auth.statusResponse == 200) //OK
    {
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<void> signOut() {
    AppPreferences.setAttribute(AppPrefAttribute.LastToken, "");
    AppPreferences.setAttribute(AppPrefAttribute.UserLogin, "");
    return null;
  }

  static getToken() async {
    AppPreferences appPreferences = await AppPreferences.getPreferences();
    return appPreferences.lastToken;
  }
}
