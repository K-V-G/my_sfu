import 'package:flutter/material.dart';
import 'package:my_sfu/models/StudentsPlan.dart';

import 'button/ButtonCource.dart';
import 'button/ButtonSemestr.dart';
import 'cells/CellsStudentPlan.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class studentsPlanView extends StatefulWidget {
  @override
  _studentsPlanView createState() => _studentsPlanView();
}

class _studentsPlanView extends State<studentsPlanView> {
  Future<List<StudentsPlan>?>? dataFuture;
  int? count_cource;
  int selectedButtonIndex = 0;
  int selectedButtonSemestr = 0;
  int cource = 1;
  int semestr = 1;

  @override
  void initState() {
    super.initState();
    dataFuture = getStudentsPlan();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Ошибка: ${snapshot.error}'),
            );
          } else {
            return Stack(
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
                    Expanded(flex: 1, child: Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0), child:
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
                                cource = 1;
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
                                cource = 2;
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
                                cource = 3;
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
                                cource = 4;
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
                                  cource = 5;
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
                                  if (cource == 1) {
                                    semestr = 1;
                                  }
                                  else if (cource == 2) {
                                    semestr = 3;
                                  }
                                  else if (cource == 3) {
                                    semestr = 5;
                                  }
                                  else if (cource == 4) {
                                    semestr = 7;
                                  }
                                  else if (cource == 5) {
                                    semestr = 9;
                                  }
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
                                  if (cource == 1) {
                                    semestr = 2;
                                  }
                                  else if (cource == 2) {
                                    semestr = 4;
                                  }
                                  else if (cource == 3) {
                                    semestr = 6;
                                  }
                                  else if (cource == 4) {
                                    semestr = 8;
                                  }
                                  else if (cource == 5) {
                                    semestr = 10;
                                  }
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
                      child: FutureBuilder<List<StudentsPlan>?>(
                        future: dataFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Ошибка: ${snapshot.error}'),
                            );
                          } else if (snapshot.hasData) {
                            List<StudentsPlan>? studentPlani = snapshot.data;
                            return ListView.builder(
                              itemCount: studentPlani?.length ?? 0,
                              itemBuilder: (context, index) {
                                StudentsPlan studentsPlan = studentPlani![index];
                                if (studentsPlan.yearOfStudy == cource && studentsPlan.semestr == semestr) {
                                  return CellsSudentPlan(
                                    type: studentsPlan.obyzatOrNeObyzat == true ? 'По выбору' : 'Обязательная',
                                    title: studentsPlan.title,
                                    cafedra: studentsPlan.department,
                                    typeExam: studentsPlan.hasExam == true ? 'Экзамен' : 'Зачет',
                                    timeLecture: concatHour(studentsPlan.totalLectureHours, 1),
                                    timePrac: concatHour(studentsPlan.totalPracticeHours, 2),
                                    timeSam: concatHour(studentsPlan.totalSelfWorkHours, 3),

                                  );
                                } else {
                                  return Container(); // Return an empty container for objects that don't meet the filter criteria
                                }
                              },
                            );
                          } else {
                            return Center(
                              child: Text('Нет данных.'),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<List<StudentsPlan>?>? getStudentsPlan() async {
    final storage = FlutterSecureStorage();
    String? accessToken = await storage.read(key: 'access_token');
    String? refreshToken = await storage.read(key: 'refresh_token');
    List<StudentsPlan> studentsPlan;
    var url_student = Uri.parse('https://api.sfu-kras.ru/api/v1/student');
    var headers = {'Authorization': 'Bearer $accessToken'};
    var count_c;


    if (accessToken != null) {
      var response = await http.get(url_student, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponce = jsonDecode(response.body);
        var data = jsonResponce['data'];
        var attributes = data['attributes'];
        var id = attributes['curriculumId'];
        var god_obychenia = attributes['termPeriodYears'];
        count_c = god_obychenia;

        var url_base = Uri.parse(
            'https://api.sfu-kras.ru/api/v1/curriculums/$id/disciplines?page%5Bsize%5D=1&page%5Bnumber%5D=1');

        response = await http.get(url_base, headers: headers);

        if (response.statusCode == 200) {
          jsonResponce = jsonDecode(response.body);
          data = jsonResponce['meta'];
          var total = data['total'];

          var url_redirect = Uri.parse(
              'https://api.sfu-kras.ru/api/v1/curriculums/$id/disciplines?page%5Bsize%5D=$total&page%5Bnumber%5D=1');
          response = await http.get(url_redirect, headers: headers);
          if (response.statusCode == 200) {
            jsonResponce = jsonDecode(response.body);
            var studentsPlanDate = jsonResponce['data'];

            studentsPlan = studentsPlanDate.map<StudentsPlan>((json) {
              var attributes = json['attributes'];
              return StudentsPlan(
                id: json['id'],
                title: attributes['title'],
                department: attributes['department'],
                totalSelfWorkHours: attributes['totalSelfWorkHours'],
                totalLectureHours: attributes['totalLectureHours'],
                totalPracticeHours: attributes['totalPracticeHours'],
                obyzatOrNeObyzat: attributes['isElective'],
                hasExam: attributes['hasExam'],
                hasPass: attributes['hasPass'],
                yearOfStudy:  attributes['yearOfStudy'],
                semestr:  attributes['semester'],
              );
            }).toList();

            setState(() {
              count_cource = count_c;
            });

            List<StudentsPlan> studentPlanConverterList = studentsPlan.toSet().toList();

            return studentPlanConverterList;
          }
        }
      }
    }
    return null;
  }

  String? concatHour(int? timeC, int id) {
    if (timeC != null) {
      if (id == 1) {
        String time = 'Лекции: ' + timeC.toString() + ' ч.';
        return time;
      }
      else if (id == 2) {
        String time = 'Практические занятия: ' + timeC.toString() + ' ч.';
        return time;
      }
      else if (id == 3) {
        String time = 'Самостоятельная работа: ' + timeC.toString() + ' ч.';
        return time;
      }
    }
    return null;
  }
}