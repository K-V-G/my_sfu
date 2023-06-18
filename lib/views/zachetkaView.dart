import 'package:flutter/material.dart';
import 'package:my_sfu/cells/CellsZachetka.dart';

import 'package:my_sfu/models/Zachetka.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../button/ButtonCource.dart';
import '../button/ButtonSemestr.dart';
import '../cache/DB_Helper.dart';

class zachetkaView extends StatefulWidget {
  @override
  _zachetkaViewPage createState() => _zachetkaViewPage();
}

class _zachetkaViewPage extends State<zachetkaView> {
  int? count_cource;
  int selectedButtonIndex = 0;
  int selectedButtonSemestr = 0;
  int cource = 1;
  int semestr = 1;
  Future<List<Zachetka>?>? futureData;

  @override
  void initState() {
    super.initState();
    futureData = getAllExamAndZachet();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<void>(
        future: futureData,
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
                      "Зачетная книжка",
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
                child: FutureBuilder<List<Zachetka>?>(
                  future: futureData,
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
                      List<Zachetka>? zachetki = snapshot.data;
                      return ListView.builder(
                        itemCount: zachetki?.length ?? 0,
                        itemBuilder: (context, index) {
                          Zachetka prikaz = zachetki![index];
                          if (prikaz.yearOfStudy == cource && prikaz.semester == getSemestr(cource, selectedButtonSemestr)) {
                            return CellsZachetkaView(
                              title: prikaz.discipline,
                              type: prikaz.controlType,
                              ocenka: prikaz.finalGrade,
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


  Future<List<Zachetka>?>? getAllExamAndZachet() async {
    final storage = FlutterSecureStorage();
    String? accessToken = await storage.read(key: 'access_token');
    String? refreshToken = await storage.read(key: 'refresh_token');
    List<Zachetka>? prikazes;
    Map<String, List<dynamic>>? maps = {};
    var idStudent = await getId();
    var idStudentOnAPI;
    var count_c;
    final dbHelper = DatabaseHelperZachetka.instance;

    var url_student = Uri.parse('https://api.sfu-kras.ru/api/v1/student');
    var url_base = Uri.parse('https://api.sfu-kras.ru/api/v1/student/grades?page%5Bsize%5D=1&page%5Bnumber%5D=1');
    var headers = {'Authorization': 'Bearer $accessToken'};

    List<Zachetka>? cachedData = await dbHelper.getZachetki();

    if (cachedData != null && cachedData.isNotEmpty) {
      final currentDate = DateTime.now();
      final cachedItem = cachedData.first;
      final liniyaGizni = DateTime.fromMillisecondsSinceEpoch(cachedItem.liniyaGizni!);
      final countCource = cachedItem.count_c;
      final idStudentFromDB = cachedItem.id_student;
      print("ИИИИИ");
      print("idFrom DB : $idStudentFromDB");
      print("idFrom SharedPref : $idStudent");
      if (currentDate.isBefore(liniyaGizni) && idStudentFromDB == idStudent) {
        print("Это все ещё я");
        setState(() {
          count_cource = countCource;
        });
        return cachedData;
      }
    }

    if (accessToken != null) {
      print("Я вызвался");
      var response = await http.get(url_base, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponce = jsonDecode(response.body);
        var data = jsonResponce['meta'];
        var total = data['total'];

        var url_redirect = Uri.parse('https://api.sfu-kras.ru/api/v1/student/grades?page%5Bsize%5D=$total&page%5Bnumber%5D=1');

        response = await http.get(url_student, headers: headers);
        if (response.statusCode == 200) {
          var jsonResponce = jsonDecode(response.body);
          var data = jsonResponce['data'];
          var attributes = data['attributes'];
          var god_obychenia = attributes['termPeriodYears'];
          var id = attributes['curriculumId'];
          count_c = god_obychenia;
          idStudentOnAPI = id;
        }

        response = await http.get(url_redirect, headers: headers);
        if (response.statusCode == 200) {
          jsonResponce = jsonDecode(response.body);
          var prikazesData = jsonResponce['data'];

          prikazes = prikazesData.map<Zachetka>((json) {
            var attributes = json['attributes'];
            return Zachetka(
              yearOfStudy: attributes['yearOfStudy'],
              semester: attributes['semester'],
              discipline: attributes['discipline'],
              controlType: attributes['controlType'],
              finalGrade: attributes['finalGrade'],
              count_c: count_c,
              id_student: idStudentOnAPI,
              liniyaGizni: DateTime.now().add(Duration(days: 30)).millisecondsSinceEpoch,
            );
          }).toList();

          await dbHelper.deleteAllRows();

          prikazes?.forEach((zachetka) {
            dbHelper.saveZachetka(zachetka);
          });
        }
      }
    }

    setState(() {
      count_cource = count_c;
    });

    return prikazes;
  }

  Future<int?> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id_student');
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
}