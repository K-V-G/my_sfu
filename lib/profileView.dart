import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'models/Group.dart';

class profieView extends StatefulWidget {
  @override
  _profileViewStatePage createState() => _profileViewStatePage();
}

class _profileViewStatePage extends State<profieView> {
  Future<Map<String, dynamic>>? dataFuture;
  String? fio;
  String? group;

  @override
  void initState() {
    super.initState();
    dataFuture = getNameAndGroup();
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
                                child: Padding(padding: EdgeInsets.only(left: 5.0),
                                  child: Column(
                                    children: [
                                      Expanded(child:Text(
                                          fio ?? '',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.0,
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
                                            Expanded(
                                              flex: 5,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  group ?? '',
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
                                      Navigator.pushNamed(context, '/privateInfo');
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
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }


  Future<Map<String, dynamic>> getNameAndGroup() async {
    final storage = FlutterSecureStorage();
    String? accessToken = await storage.read(key: 'access_token');
    String? refreshToken = await storage.read(key: 'refresh_token');
    var url_group = Uri.parse('https://api.sfu-kras.ru/api/v1/student/timetable/suitable-groups');
    var url_name = Uri.parse('https://api.sfu-kras.ru/api/v1/user');
    var headers = {'Authorization': 'Bearer $accessToken'};
    final Map<String, dynamic> responseData = {};
    List<Group> groups;

    if (accessToken != null) {
      var response = await http.get(url_name, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponce = jsonDecode(response.body);
        var data = jsonResponce['data'];
        var attributes = data['attributes'];
        var lastName = attributes['lastName'];
        var firstName = attributes['firstName'];
        var middleName = attributes['middleName'];

        fio = lastName + ' ' + firstName + ' ' + middleName;
        responseData['fio'] = fio;
      }

      var response1 = await http.get(url_group, headers: headers);
      if (response1.statusCode == 200) {
        var jsonResponce = jsonDecode(response1.body);
        var prikazesData = jsonResponce['data'];

        groups = prikazesData.map<Group>((json) {
          var attributes = json['attributes'];
          return Group(
              name: attributes['name']
          );
        }).toList();

        List<Group> newListGroup = groups.toSet().toList();
        if (newListGroup.length == 1) {
          String name = newListGroup[0].name;
          responseData['group'] = name;
        } else {
          responseData['group'] = 'Данные недоступны';
        }
      }
      else {
        print("Ошибка в получении группы");
      }
      setState(() {
        fio = responseData['fio'];
        group = responseData['group'];
      });
    }
    return responseData;
  }
}