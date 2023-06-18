import 'package:flutter/material.dart';
import 'package:my_sfu/models/StudentsPlan.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../button/ButtonCource.dart';
import '../button/ButtonSemestr.dart';
import '../cache/DB_Helper_Students_Plan.dart';
import '../cells/CellsStudentPlan.dart';

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
                    Expanded(flex: 10, child: Text("")),
                    const Expanded(
                      flex: 10,
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
                    Expanded(flex: 10, child: Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0), child:
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
                    Expanded(
                      flex: 10,
                      child: Row(
                        children: [
                          Expanded(flex: 5, child: Text("")),
                          Expanded(
                            flex: 90,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 45,
                                  child: SizedBox(
                                    height: 50,
                                    child: ButtonSemestr(
                                      buttonText: '1 семестр',
                                      onPressed: () {
                                        setState(() {
                                          selectedButtonSemestr = 0;
                                        });
                                      },
                                      isOrange: selectedButtonSemestr == 0,
                                    ),
                                  ),
                                ),
                                Expanded(flex: 5, child: Text("")),
                                Expanded(
                                  flex: 45,
                                  child: SizedBox(
                                    height: 50,
                                    child: ButtonSemestr(
                                      buttonText: '2 семестр',
                                      onPressed: () {
                                        setState(() {
                                          selectedButtonSemestr = 1;
                                        });
                                      },
                                      isOrange: selectedButtonSemestr == 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(flex: 5, child: Text("")),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 60,
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
                                if (studentsPlan.yearOfStudy == cource && studentsPlan.semestr == getSemestr(cource, selectedButtonSemestr)) {
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
                                  return Container();
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
    var idStudent = await getId();
    var idStudentOnAPI;
    var count_c;
    final dbHelper = DatabaseHelperStudentsPlan.instance;

    List<StudentsPlan>? cachedData = await dbHelper.getStudentsPlan();

    if (cachedData != null && cachedData.isNotEmpty) {
      final currentDate = DateTime.now();
      final cachedItem = cachedData.first;
      final liniyaGizni = DateTime.fromMillisecondsSinceEpoch(cachedItem.liniyaGizni!);
      final countCource = cachedItem.count_c;
      final idStudentFromDB = cachedItem.id_student;

      if (currentDate.isBefore(liniyaGizni) && idStudentFromDB == idStudent) {
        print("Это все ещё я");
        setState(() {
          count_cource = countCource;
        });
        return cachedData;
      }
    }


    if (accessToken != null) {
      var response = await http.get(url_student, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponce = jsonDecode(response.body);
        var data = jsonResponce['data'];
        var attributes = data['attributes'];
        var id = attributes['curriculumId'];
        var god_obychenia = attributes['termPeriodYears'];
        count_c = god_obychenia;
        idStudentOnAPI = id;

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
                idStudentsPlan: json['id'],
                title: attributes['title'],
                department: attributes['department'],
                totalSelfWorkHours: attributes['totalSelfWorkHours'],
                totalLectureHours: attributes['totalLectureHours'],
                totalPracticeHours: attributes['totalPracticeHours'],
                obyzatOrNeObyzat: attributes['isOptional'],
                hasExam: attributes['hasExam'],
                hasPass: attributes['hasPass'],
                yearOfStudy:  attributes['yearOfStudy'],
                semestr:  attributes['semester'],
                count_c: count_c,
                id_student: idStudentOnAPI,
                liniyaGizni: DateTime.now().add(Duration(days: 7)).millisecondsSinceEpoch,
              );
            }).toList();

            setState(() {
              count_cource = count_c;
            });

            List<StudentsPlan> studentPlanConverterList = studentsPlan.toSet().toList();

            await dbHelper.deleteAllRows();

            studentPlanConverterList.forEach((st) {
              dbHelper.saveStudentsPlan(st);
            });

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

  int getSemestr(int course, int id) {
    if (cource == 1) {
      if (id == 0) {
        return 1;
      }
      else {
        return 2;
      }
    }
    if (cource == 2) {
      if (id == 0) {
        return 3;
      }
      else {
        return 4;
      }
    }
    if (cource == 3) {
      if (id == 0) {
        return 5;
      }
      else {
        return 6;
      }
    }
    if (cource == 4) {
      if (id == 0) {
        return 7;
      }
      else {
        return 8;
      }
    }
    if (cource == 5) {
      if (id == 0) {
        return 9;
      }
      else {
        return 10;
      }
    }
    return 100;
  }

  Future<int?> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id_student');
  }

}