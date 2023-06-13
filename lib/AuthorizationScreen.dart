import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class AuthorizationScreen extends StatelessWidget {
  final String authorizationUrl;

  const AuthorizationScreen({required this.authorizationUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
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
              print(authorizationCode);
              print(authorizationCode);
              print(authorizationCode);
            } else {
              print('Код авторизации не найден');
            }
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  /*Future<void> exchangedCodeForToken(String authorizationCode) async {
    var authorizationEndpoint = Uri.parse('https://api.sfu-kras.ru/oauth/authorize');
    var tokenEndpoint = Uri.parse('https://api.sfu-kras.ru/oauth/token');
    var clientId = '11';
    var redirectUri = Uri.parse('mobile-app://callback');

    var grant = oauth2.AuthorizationCodeGrant(
      clientId,
      authorizationEndpoint,
      tokenEndpoint,
    );
    var client = await grant.handleAuthorizationResponse(redirectUri.queryParameters);
    Map<String, dynamic> tokenObj = {};
    tokenObj['expires_in'] = client.credentials.expiration;
    tokenObj['access_token'] = client.credentials.accessToken;
    tokenObj['refresh_token'] = client.credentials.refreshToken;


    print(tokenObj['access_token']);
    print(tokenObj['access_token']);
    print(tokenObj['access_token']);

  }*/
}