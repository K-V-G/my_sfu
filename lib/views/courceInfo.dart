import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sfu/models/OcenkyInfo.dart';

import '../cells/ocenkyInfoCource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class courceOcenkyInfo extends StatefulWidget {
  final String title;
  final int id;

  courceOcenkyInfo({required this.title, required this.id});

  @override
  _courceOcenkyInfoState createState() => _courceOcenkyInfoState();
}

class _courceOcenkyInfoState extends State<courceOcenkyInfo> {
  Future<List<OcenkyInfo>?>? dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = getAllOcenkyInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:

        FutureBuilder<void>(
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
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 20,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SvgPicture.asset("assets/image/strelka_nazad.svg"),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 80,
                          child: SingleChildScrollView(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                widget.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(""),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: FutureBuilder<List<OcenkyInfo>?>(
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
                      List<OcenkyInfo>? ocenkiInfos = snapshot.data;
                      return ListView.builder(
                        itemCount: ocenkiInfos?.length ?? 0,
                        itemBuilder: (context, index) {
                          OcenkyInfo ocenkyInfo = ocenkiInfos![index];
                          return ocenkyCourceInfo(
                            title: ocenkyInfo.name,
                            minZnach: getRangeZnach(ocenkyInfo.range, 1),
                            maxZnach: getRangeZnach(ocenkyInfo.range, 2),
                            tecZnach: getTecZnach(ocenkyInfo.grade),
                          );
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


  Future<List<OcenkyInfo>?>? getAllOcenkyInfo() async {
    final storage = FlutterSecureStorage();
    String? accessToken = await storage.read(key: 'access_token');
    String? refreshToken = await storage.read(key: 'refresh_token');
    var id = widget.id;
    List<OcenkyInfo>? ocenky;

    var url_ocenky_info = Uri.parse('https://api.sfu-kras.ru/api/v1/student/elearning/courses/$id/grades');
    var headers = {'Authorization': 'Bearer $accessToken'};


    if (accessToken != null) {
      var response = await http.get(url_ocenky_info, headers: headers);
      if (response.statusCode == 200) {
          var jsonResponce = jsonDecode(response.body);
          var prikazesData = jsonResponce['data'];

          ocenky = prikazesData.map<OcenkyInfo>((json) {
            var attributes = json['attributes'];
            return OcenkyInfo(
              name: attributes['name'],
              grade: attributes['grade'],
              range: attributes['range'],
            );
          }).toList();

          if (ocenky!.length > 1) {
            // Remove the first element from the list
            ocenky.removeAt(0);
            print('Удалился');
          }
          print('Все норм');

          return ocenky;
        }
      }
    return null;
  }

  dynamic getTecZnach(String? tecZnach) {
    double znach;
    if (tecZnach == '-') {
      return null;
    }
    else if (tecZnach == null) {
      return null;
    }
    else {
      if (int.tryParse(tecZnach!) == null && double.tryParse(tecZnach!) == null) {
        return tecZnach;
      }
      else {
        znach = double.parse(tecZnach!);
        return znach;
      }
    }
  }
  dynamic getRangeZnach(String? tecZnach, int id) {
    if (tecZnach != null) {
      List<String> numbers = tecZnach.split("-");
      if (double.tryParse(numbers[0]) == null && int.tryParse(numbers[0]) == null) {
        if (id == 1) {
          return numbers[0];
        }
        else {
          return numbers[1];
        }
      }
      else {
        double? minValue = double.parse(numbers[0]);
        double? maxValue = double.parse(numbers[1]);
        if (id == 1) {
          return minValue;
        }
        else {
          return maxValue;
        }
      }
    }
    else {
      return null;
    }
  }
}