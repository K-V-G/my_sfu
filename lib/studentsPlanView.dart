import 'package:flutter/material.dart';

import 'button/ButtonCource.dart';
import 'button/ButtonSemestr.dart';
import 'cells/CellsStudentPlan.dart';

class studentsPlanView extends StatefulWidget {
  @override
  _studentsPlanView createState() => _studentsPlanView();
}

class _studentsPlanView extends State<studentsPlanView> {
  var count_cource = 5;
  int selectedButtonIndex = 0;
  int selectedButtonSemestr = 0;
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
                    alignment: Alignment.center,
                    child: Text(
                      "Учебный план",
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
              Expanded(
                  flex: 1,
                  child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child:
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 90,
                          child: ButtonCource(
                            buttonText: '1 курс',
                            onPressed: () {
                              setState(() {
                                selectedButtonIndex = 0;
                              });
                            },
                            isOrange: selectedButtonIndex == 0,
                          ),
                        ),
                        Container(
                          width: 90,
                          child: ButtonCource(
                            buttonText: '2 курс',
                            onPressed: () {
                              setState(() {
                                selectedButtonIndex = 1;
                              });
                            },
                            isOrange: selectedButtonIndex == 1,
                          ),
                        ),
                        Container(
                          width: 90,
                          child: ButtonCource(
                            buttonText: '3 курс',
                            onPressed: () {
                              setState(() {
                                selectedButtonIndex = 2;
                              });
                            },
                            isOrange: selectedButtonIndex == 2,
                          ),
                        ),
                        Container(
                          width: 90,
                          child: ButtonCource(
                            buttonText: '4 курс',
                            onPressed: () {
                              setState(() {
                                selectedButtonIndex = 3;
                              });
                            },
                            isOrange: selectedButtonIndex == 3,
                        ),
                      ),
                      if (count_cource == 5)
                        Container(
                          width: 90,
                          child: ButtonCource(
                            buttonText: '5 курс',
                            onPressed: () {
                              setState(() {
                                selectedButtonIndex = 4;
                              });
                            },
                            isOrange: selectedButtonIndex == 4,
                          ),
                        ),
                    ],

                  ),
                  )
                  ),
              Expanded(flex: 1, child: Row(
                children: [
                  Expanded(flex: 5, child: Text("")),
                  Expanded(flex: 90, child: Row(
                    children: [
                      Expanded(flex: 45, child: ButtonSemestr(
                        buttonText: '1 семестр',
                        onPressed: () {
                          setState(() {
                            selectedButtonSemestr = 0;
                          });
                        },
                        isOrange: selectedButtonSemestr == 0,
                      ),),
                      Expanded(flex: 5, child: Text("")),
                      Expanded(flex: 45, child: ButtonSemestr(
                        buttonText: '2 семестр',
                        onPressed: () {
                          setState(() {
                            selectedButtonSemestr = 1;
                          });
                        },
                        isOrange: selectedButtonSemestr == 1,
                      )),
                    ],
                  ),),
                  Expanded(flex: 5, child: Text("")),
                ],
              )),

              Expanded(
                  flex: 5,
                  child:Row(
                    children: [
                      Expanded(flex: 100, child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          CellsSudentPlan(
                            type: 'Обязательная',
                            title: 'Б1.В Инженерия требований к программному обеспечению',
                            cafedra: 'Кафедра Информатики',
                            typeExam: 'Зачет',
                            timeLecture: 'Лекции: 18 ч.',
                            timePrac: 'Практические занятия: 54 ч.',
                            timeSam: 'Самостоятельная работа: 72 ч.',
                          ),
                          CellsSudentPlan(
                            type: 'Обязательная',
                            title: 'Б1.В Инженерия требований к программному обеспечению',
                            cafedra: 'Кафедра Информатики',
                            typeExam: 'Зачет',
                            timeLecture: 'Лекции: 18 ч.',
                            timePrac: 'Практические занятия: 54 ч.',
                            timeSam: 'Самостоятельная работа: 72 ч.',
                          ),
                          CellsSudentPlan(
                            type: 'Обязательная',
                            title: 'Б1.В Инженерия требований к программному обеспечению',
                            cafedra: 'Кафедра Информатики',
                            typeExam: 'Зачет',
                            timeLecture: 'Лекции: 18 ч.',
                            timePrac: 'Практические занятия: 54 ч.',
                            timeSam: 'Самостоятельная работа: 72 ч.',
                          ),
                        ],
                      )),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}