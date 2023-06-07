import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class profieViewSudents extends StatefulWidget {
  @override
  _profileViewStatePage createState() => _profileViewStatePage();
}

class _profileViewStatePage extends State<profieViewSudents> {
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
              Expanded(flex: 1, child: Text("")),
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Личная информация",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 7, child: Text("")),
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
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Обработчик события при нажатии на кнопку
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 27,
                                        child: SvgPicture.asset(
                                          'assets/image/zachetca.svg',
                                          color: Color(0xffBEBDC0),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Зачетка",
                                      style: TextStyle(
                                        color: Color(0xffBEBDC0),
                                        fontSize: 10.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Обработчик события при нажатии на кнопку
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 27,
                                        child: SvgPicture.asset(
                                          'assets/image/prikazy.svg',
                                          color: Color(0xffBEBDC0),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Приказы",
                                      style: TextStyle(
                                        color: Color(0xffBEBDC0),
                                        fontSize: 10.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Обработчик события при нажатии на кнопку
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 27,
                                        child: SvgPicture.asset(
                                          'assets/image/students_plan.svg',
                                          color: Color(0xffBEBDC0),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Учебный план",
                                      style: TextStyle(
                                        color: Color(0xffBEBDC0),
                                        fontSize: 10.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Обработчик события при нажатии на кнопку
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 27,
                                        child: SvgPicture.asset(
                                          'assets/image/ocenky.svg',
                                          color: Color(0xffBEBDC0),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Оценки",
                                      style: TextStyle(
                                        color: Color(0xffBEBDC0),
                                        fontSize: 10.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Обработчик события при нажатии на кнопку
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 27,
                                        child: SvgPicture.asset(
                                          'assets/image/profile.svg',
                                          color: Color(0xffEF5126),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Профиль",
                                      style: TextStyle(
                                        color: Color(0xffEF5126),
                                        fontSize: 10.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}