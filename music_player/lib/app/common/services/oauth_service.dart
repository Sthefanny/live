import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:oauth_dio/oauth_dio.dart';

import '../configs/auth_config.dart';
import '../configs/url_configs.dart';

part 'oauth_service.g.dart';

class oAuthService = _oAuthServiceBase with _$oAuthService;

abstract class _oAuthServiceBase with Store {
  final Dio _dio;
  final oauth = OAuth(tokenUrl: UrlConfig.tokenUrl, clientId: AuthConfig.clientId, clientSecret: AuthConfig.clientSecret);

  _oAuthServiceBase(this._dio);

  @observable
  String username;
  @observable
  String password;

  @action
  changeUser(String value) => username = value;
  @action
  changePassword(String value) => password = value;

  getAccessToken() {
    OAuthToken token = oauth.requestToken(grantType: 'password', username: username, password: password).then((token) {
      print(token.accessToken);
      _dio.get(UrlConfig.authorizeUrl)
      return token;
    });
  }

  updateAccessToken() {
    OAuthToken token = oauth.requestToken(grantType: 'refresh_token', refreshToken: '<YOUR REFRESH TOKEN>').then((token) {
      print(token.accessToken);
    });
  }
}
