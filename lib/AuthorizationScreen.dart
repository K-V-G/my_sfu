import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_sfu/views/windowView.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthorizationScreen extends StatelessWidget {
  final String authorizationUrl;
  final String codeVerifier;

  const AuthorizationScreen({required this.authorizationUrl, required this.codeVerifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp (
        debugShowCheckedModeBanner: false,
        home: WebView(
        initialUrl: authorizationUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          webViewController.clearCache();
          final cookieManager = CookieManager();
          cookieManager.clearCookies();
        },
        navigationDelegate: (NavigationRequest request) async {
          if (request.url.startsWith('mobile-app://callback')) {
            String? authorizationCode = Uri.parse(request.url).queryParameters['code'];
            if (authorizationCode != null) {
              String acessToken = await getTokens(authorizationCode, codeVerifier);
              await getUserInfo(acessToken);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => windowView(),
                ),
              );
            } else {
              print('Код авторизации не найден');
            }
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    ));
  }

  Future<String> getTokens(String authorizationCode, String codeVerifier) async {
    var tokenEndpoint = Uri.parse('https://api.sfu-kras.ru/oauth/token');
    var clientId = '11';
    var redirectUri = Uri.parse('mobile-app://callback');
    var grantType = 'authorization_code';
    var accessToken = '';
    final storage = FlutterSecureStorage();

    var body = {
      'client_id': clientId,
      'grant_type': grantType,
      'code': authorizationCode,
      'redirect_uri': redirectUri.toString(),
      'code_verifier': codeVerifier,
    };
    var response = await http.post(tokenEndpoint, body: body);

    if (response.statusCode == 200) {
      var tokenResponse = jsonDecode(response.body);
      accessToken = tokenResponse['access_token'];
      var refreshToken = tokenResponse['refresh_token'];
      var expiresIn = tokenResponse['expires_in'];

      await storage.write(key: 'access_token', value: accessToken);
      await storage.write(key: 'refresh_token', value: refreshToken);
      await storage.write(key: 'expires_in', value: expiresIn.toString());

    }
    else {
      print('Ошибка получения токенов авторизации: ${response.statusCode}}');
    }
    return accessToken;
  }

  Future<void> getUserInfo(String accessToken) async {
    var url = Uri.parse('https://api.sfu-kras.ru/api/v1/user');
    var headers = {'Authorization': 'Bearer $accessToken'};

    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var jsonResponce = jsonDecode(response.body);
      var data = jsonResponce['data'];
      var attributes = data['attributes'];
      var firstName = attributes['firstName'];
      var lastName = attributes['lastName'];
      var middleName = attributes['middleName'];

      print('firstName: $firstName and lastName: $lastName and middleName: $middleName');
    }
  }
}