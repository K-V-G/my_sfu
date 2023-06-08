import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_sfu/prikazyView.dart';
import 'package:my_sfu/profileView.dart';
import 'package:my_sfu/studentsPlanView.dart';
import 'package:my_sfu/zachetkaView.dart';

import 'ocenkyView.dart';

class windowView extends StatefulWidget {
  @override
  _windowViewState createState() => _windowViewState();
}

class _windowViewState extends State<windowView> {
  var color_index = 0;
  Widget mainWidget = profieView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              color: const Color(0xffFFFFFF),
            ),
            Column(
              children: [
                  Expanded(flex: 8, child: mainWidget),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color(0xffE0E0E0),
                              width: 1.0,
                            ),
                          ),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    mainWidget = zachetkaView();
                                    color_index = 4;
                                  });
                                },
                                child:Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       Container(
                                          width: 30,
                                          height: 27,
                                          child: SvgPicture.asset(
                                            'assets/image/zachetca.svg',
                                            color: color_index == 4 ? Color(0xffEF5126) : Color(0xffBEBDC0),
                                          ),
                                        ),
                                      Text(
                                        "Зачетка",
                                        style: TextStyle(
                                          color: color_index == 4 ? Color(0xffEF5126) : Color(0xffBEBDC0),
                                          fontSize: 10.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    mainWidget = prikazyView();
                                    color_index = 1;
                                  });
                                },
                                child:Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       Container(
                                          width: 30,
                                          height: 27,
                                          child: SvgPicture.asset(
                                            'assets/image/prikazy.svg',
                                            color:color_index == 1 ? Color(0xffEF5126) : Color(0xffBEBDC0),
                                          ),
                                        ),
                                      Text(
                                        "Приказы",
                                        style: TextStyle(
                                          color: color_index == 1 ? Color(0xffEF5126) : Color(0xffBEBDC0),
                                          fontSize: 10.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    mainWidget = studentsPlanView();
                                    color_index = 2;
                                  });
                                },
                                child:Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       Container(
                                          width: 30,
                                          height: 27,
                                          child: SvgPicture.asset(
                                            'assets/image/students_plan.svg',
                                            color: color_index == 2 ? Color(0xffEF5126) : Color(0xffBEBDC0),
                                          ),
                                        ),
                                      Text(
                                        "Учебный план",
                                        style: TextStyle(
                                          color: color_index == 2 ? Color(0xffEF5126) : Color(0xffBEBDC0),
                                          fontSize: 10.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    mainWidget = ocenkyView();
                                    color_index = 3;
                                  });
                                },
                                child:Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 30,
                                          height: 27,
                                          child: SvgPicture.asset(
                                            'assets/image/ocenky.svg',
                                            color: color_index == 3 ? Color(0xffEF5126) : Color(0xffBEBDC0),
                                          ),
                                        ),

                                      Text(
                                        "Оценки",
                                        style: TextStyle(
                                          color: color_index == 3 ? Color(0xffEF5126) : Color(0xffBEBDC0),
                                          fontSize: 10.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    mainWidget = profieView();
                                    color_index = 0;
                                  });
                                },
                                child:Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 30,
                                          height: 27,
                                          child: SvgPicture.asset(
                                            'assets/image/profile.svg',
                                            color: color_index == 0 ? Color(0xffEF5126) : Color(0xffBEBDC0),
                                          ),
                                        ),

                                      Text(
                                        "Профиль",
                                        style: TextStyle(
                                          color: color_index == 0 ? Color(0xffEF5126) : Color(0xffBEBDC0),
                                          fontSize: 10.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}