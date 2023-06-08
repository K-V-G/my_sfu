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
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(flex: 10, child: Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 10.0) ,
                        child: InkWell(onTap: () {
                          Navigator.pushNamed(context, '/window');
                        },
                            child: Align(alignment: Alignment.topCenter,
                                 child: SvgPicture.asset("assets/image/strelka_nazad.svg"))))),
                    const Expanded(flex: 80, child:  Align(
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
                    const Expanded(flex: 10, child: Text(""))
                    ],
                  )
              ),
              Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(flex: 10, child: Text("")),
                      Expanded(flex: 80, child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffEF5126),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
                                  child: Column(
                                      children: [
                                        Expanded(flex: 1, child: Row(
                                          children: [
                                            Expanded(flex: 10,
                                                child: SvgPicture.asset('assets/image/profile_icons.svg')),
                                            const Expanded(flex: 90,
                                                child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                  , child: Text(
                                                    'Говорин Кирилл Игы-Ондорлы Васильевич Сан',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontFamily: 'Ubuntu',
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),)
                                            )
                                          ],
                                        )),
                                        Expanded(flex: 1, child: Row(
                                          children: [
                                            Expanded(flex: 10,
                                                child: SvgPicture.asset('assets/image/group.svg',
                                                  color: Colors.black,)),
                                            const Expanded(flex: 90,
                                                child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                  , child: Text(
                                                    'КИ19-16.255433аауу',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontFamily: 'Ubuntu',
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),)
                                            )
                                          ],
                                        )),
                                        Expanded(flex: 1, child: Row(
                                          children: [
                                            Expanded(flex: 10,
                                                child: SvgPicture.asset('assets/image/institut_icons.svg',
                                                  color: Colors.black,)),
                                            const Expanded(flex: 90,
                                                child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                  , child: Text(
                                                    'ИКИТ',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontFamily: 'Ubuntu',
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),)
                                            )
                                          ],
                                        )),
                                      ],
                                  ),
                                )
                            ),),
                          const Expanded(flex: 1, child: Text("")),
                          Expanded(
                            flex: 2,
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffEF5126),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
                                  child: Column(
                                    children: [
                                      Expanded(flex: 1, child: Row(
                                        children: [
                                          Expanded(flex: 10,
                                              child: SvgPicture.asset('assets/image/rang_icons.svg')),
                                          const Expanded(flex: 90,
                                              child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                , child: Text(
                                                  'Студент',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontFamily: 'Ubuntu',
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                ),)
                                          )
                                        ],
                                      )),
                                      Expanded(flex: 1, child: Row(
                                        children: [
                                          Expanded(flex: 10,
                                              child: SvgPicture.asset('assets/image/dolgnost_icons.svg',
                                                color: Colors.black,)),
                                          const Expanded(flex: 90,
                                              child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                , child: Text(
                                                  'Учащийся',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontFamily: 'Ubuntu',
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                ),)
                                          )
                                        ],
                                      )),
                                      Expanded(flex: 1, child: Row(
                                        children: [
                                          Expanded(flex: 10,
                                              child: SvgPicture.asset('assets/image/email_icon.svg',
                                                color: Colors.black,)),
                                          const Expanded(flex: 90,
                                              child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                , child: Text(
                                                  'goworin.k@yandex.ru',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontFamily: 'Ubuntu',
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                ),)
                                          )
                                        ],
                                      )),
                                    ],
                                  ),
                                )
                            ),),
                        ],
                      )),
                      Expanded(flex: 10, child: Text(""))
                    ],
                  )),
              Expanded(flex: 3, child: Text("")),
            ],
          ),
        ],
      ),
    );
  }
}