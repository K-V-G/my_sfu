import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;

class initialView extends StatefulWidget {
  @override
  _initialViewState createState() => _initialViewState();
}
class _initialViewState extends State<initialView> {
  final authorizationEndpoint = Uri.parse('https://api.sfu-kras.ru/login');
  final redirectURL = Uri.parse('https://api.sfu-kras.ru');

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
                                        'Персональный помощник для студентов и преподавателей СФУ',
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

