import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import '../AuthorizationScreen.dart';

class initialView extends StatefulWidget {
  @override
  _initialViewState createState() => _initialViewState();
}
class _initialViewState extends State<initialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xffEF5126),
          ),
          CustomPaint(
            painter: WaveBackgroundPainter(),
            child: Column(
                   children: [
                     Expanded(flex: 2, child: Text("")),
                      Expanded(flex: 2, child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 30.0),
                              Row(
                                children: [
                                  Expanded(flex: 1, child: SizedBox()),
                                  Expanded(
                                    flex: 3,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Мой СФУ',
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 1, child: SizedBox()),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Expanded(flex: 1, child: SizedBox()),
                                  Expanded(
                                    flex: 3,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Персональный помощник для студентов СФУ',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 1, child: SizedBox()),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),),

                     Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Row(
                         children: [
                           Expanded(flex: 1, child: SizedBox(),),
                           Expanded(
                             flex: 4,
                             child: ElevatedButton(
                               onPressed: () {
                                 fetchToken(context);
                               },
                               style: ElevatedButton.styleFrom(
                                 primary: const Color(0xffEF5126), // Оранжевый цвет кнопки
                                 padding: EdgeInsets.symmetric(vertical: 16.0),
                               ),
                               child: const Text(
                                 'Войти',
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 24.0,
                                   fontWeight: FontWeight.normal,
                                   fontFamily: "Roboto",
                                 ),
                               ),
                             ),
                           ),
                           Expanded(flex: 1, child: SizedBox(),)
                         ],
                       ),
                     ),
                     const Expanded(
                       flex: 1,
                       child: Padding(
                         padding: EdgeInsets.only(bottom: 16.0),
                         child: Align(
                           alignment: Alignment.bottomCenter,
                           child: Text(
                             "Powered by KWG",
                             style: TextStyle(
                               color: Color(0xffEF5126),
                               fontSize: 20.0,
                               fontFamily: 'Roboto',
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
            )
          ),
        ],
      ),
    );
  }

  Future<String> fetchToken(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {

      return Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Нет подключения к Интеренту'),
              content: Text('Проверьте свое подключение к Интернету и еще раз попробуйте войти'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }).then((_) {
        return 'No Internet Connection';
      });
    }

    var authorizationEndpoint = Uri.parse('https://api.sfu-kras.ru/oauth/authorize');
    var tokenEndpoint = Uri.parse('https://api.sfu-kras.ru/oauth/token');
    var clientId = '11';
    var rediectUri = Uri.parse('mobile-app://callback');
    var codeVerifier = await generateCodeVerifier();
    var codeChallenge = await generateCodeChallenge(codeVerifier);
    var codeChallengeMethod = 'S256';

    var grant = oauth2.AuthorizationCodeGrant(
        clientId,
        authorizationEndpoint,
        tokenEndpoint);

    var authorizationUrl = '$authorizationEndpoint?response_type=code&client_id=$clientId&redirect_uri=$rediectUri&code_challenge=$codeChallenge&code_challenge_method=$codeChallengeMethod';
    await navigateToAuthorizationScreen(context, authorizationUrl, codeVerifier);

    return 'OK';
  }

  Future<String> generateCodeVerifier() async {
    final random = Random();
    final length = 43 + random.nextInt(86);
    final allowedCharacters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-~_';
    final StringBuffer buffer = StringBuffer();

    for (var i = 0; i < length; i++) {
      final randomIndex = random.nextInt(allowedCharacters.length);
      buffer.write(allowedCharacters[randomIndex]);
    }

    return buffer.toString();
  }

  Future<void> navigateToAuthorizationScreen(BuildContext context,
      String authorizationUrl, String codeVerifier) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => AuthorizationScreen(
          authorizationUrl: authorizationUrl,
        codeVerifier: codeVerifier,)
    ));
  }

  Future<String> generateCodeChallenge(String codeVerifier) async {
    var bytes = utf8.encode(codeVerifier);
    var digest = sha256.convert(bytes);
    var base64Url = base64UrlEncode(digest.bytes);
    return base64Url
        .replaceAll('+', '-')
        .replaceAll('/', '_')
        .replaceAll('=', '');
  }
}


class WaveBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.2, size.width, size.height * 0.3)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

