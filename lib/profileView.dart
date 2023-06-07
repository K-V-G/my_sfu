import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class profieView extends StatefulWidget {
  @override
  _profileViewStatePage createState() => _profileViewStatePage();
}

class _profileViewStatePage extends State<profieView> {
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
              const Expanded(flex: 1, child: Text("")),
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Мой профиль",
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
              Expanded(flex: 1,
                  child:Padding(padding: EdgeInsets.only(left: 0.0),
                      child: Row(
                    children: [
                      const Expanded(flex: 5, child: Text("")),
                      Expanded(
                        flex: 20,
                        child: SvgPicture.asset(
                            'assets/image/logo.svg'
                        ),
                      ),
                       Expanded(
                        flex: 70,
                        child: Padding(padding: EdgeInsets.only(left: 10.0), child: Column(
                          children: [
                            const Expanded(flex: 1, child:Text(
                                'Говорин Кирилл Игы-Ондорлы Васильевич Сан',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.normal,
                                ))),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SvgPicture.asset('assets/image/group.svg'),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 5,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'КИ19-16.255433аауу',
                                        style: TextStyle(
                                          color: Color(0xffA8A8A8),
                                          fontSize: 14.0,
                                          fontFamily: 'Ubuntu',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),),
                      ),
                      const Expanded(flex: 5, child: Text("")),
                    ],
                  ),)

              ),
              Expanded(flex: 1, child: Padding (padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                children: [
                  const Expanded(flex: 5, child: Text("")),
                  Expanded(
                      flex: 90,
                      child: InkWell(
                          onTap: () {
                            // Обработчик события при нажатии на кнопку
                          },
                          child: Column(
                            children: [
                              Expanded(child: Row(
                                children: [
                                  const Expanded(flex: 50, child: Align(alignment: Alignment.center, child: Text(
                                    "Личные данные",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),)
                                  ),
                                  const Expanded(flex: 30, child: Text("")),
                                  Expanded(flex: 20, child: Align(
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset("assets/image/strelka.svg"),
                                  ),)
                                ],
                              )),
                              const Expanded(child: Divider(height: 2, color: Colors.black),)],
                          ))),
                  const Expanded(flex: 5, child: Text("")),
                ],
              ))
                  ),
              const Expanded(flex: 3, child: Text("")),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(flex: 10, child: Text("")),
                    Expanded(flex: 80, child: Padding(padding: EdgeInsets.only(bottom: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Обработчик нажатия кнопки
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff6D2D34),
                            minimumSize: Size(double.infinity, 48.0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Выйти из аккаунта',
                            style: TextStyle(
                              color: Color(0xffFF3347),
                              fontSize: 22.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ),)),
                    Expanded(flex: 10, child: Text(""))
                ],
                )
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
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