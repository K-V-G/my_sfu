import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class profieViewSudents extends StatefulWidget {
  @override
  _profileViewStatePage createState() => _profileViewStatePage();
}

class _profileViewStatePage extends State<profieViewSudents> {
  Future<Map<String, dynamic>>? dataFuture;
  String? fio;
  String? group;
  String? uni;
  String? status;
  String? rang;
  String? email;

  @override
  void initState() {
    super.initState();
    dataFuture = getStudentsInfo();
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
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(flex: 10, child: Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 10.0) ,
                        child: InkWell(onTap: () {
                          Navigator.pop(context);
                        },
                            child: Align(alignment: Alignment.topCenter,
                                 child: SvgPicture.asset("assets/image/strelka_nazad.svg"))))),
                    const Expanded(flex: 80, child:  Align(
                        alignment: Alignment.center,
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
                                            Expanded(flex: 90,
                                                child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                  , child: Text(
                                                    fio ?? '',
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
                                            Expanded(flex: 90,
                                                child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                  , child: Text(
                                                    group ?? '',
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
                                            Expanded(flex: 90,
                                                child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                  , child: Text(
                                                    uni ?? '',
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
                                          Expanded(flex: 90,
                                              child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                , child: Text(
                                                  status ?? '',
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
                                          Expanded(flex: 90,
                                              child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                , child: Text(
                                                  rang ?? '',
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
                                          Expanded(flex: 90,
                                              child: Padding(padding: EdgeInsets.only(left: 10.0)
                                                , child: Text(
                                                  email ?? '',
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
            );
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> getStudentsInfo() async {
    final storage = FlutterSecureStorage();
    String? accessToken = await storage.read(key: 'access_token');
    String? refreshToken = await storage.read(key: 'refresh_token');

    var url_group = Uri.parse('https://api.sfu-kras.ru/api/v1/student/timetable/suitable-groups');
    var url_name = Uri.parse('https://api.sfu-kras.ru/api/v1/user');
    var url_student = Uri.parse('https://api.sfu-kras.ru/api/v1/student');
    var headers = {'Authorization': 'Bearer $accessToken'};

    final Map<String, dynamic> responseData = {};

    if (accessToken != null) {
      var response = await http.get(url_name, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponce = jsonDecode(response.body);
        var data = jsonResponce['data'];
        var attributes = data['attributes'];
        var lastName = attributes['lastName'];
        var firstName = attributes['firstName'];
        var middleName = attributes['middleName'];
        var status = attributes['position'];

        fio = lastName + ' ' + firstName + ' ' + middleName;
        responseData['fio'] = fio;
        responseData['status'] = status;
      }
      response = await http.get(url_student, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponce = jsonDecode(response.body);
        var data = jsonResponce['data'];
        var attributes = data['attributes'];
        var status = attributes['status'];

        responseData['rang'] = status;
      }

      /*var response1 = await http.get(url_group, headers: headers);
      if (response1.statusCode == 200) {
        var jsonResponce = jsonDecode(response1.body);
        var data = jsonResponce['data'];
        var attributes = data['attributes'];
        var timetableName = attributes['name'];
        print('name: $timetableName');
        responseData['group'] = timetableName;
      }
      else {
        print("Ошибка в получении группы");
      }*/

      setState(() {
        fio = responseData['fio'];
        status = responseData['status'];
        rang = responseData['rang'];
        /*group = responseData['group'];*/
        group = 'KI19-16/2';
        uni = 'IKIT';
        email = "gow@yandex.ru";
      });
    }
    return responseData;
  }
}