import 'dart:ffi';

import 'package:flutter/material.dart';

import 'cells/CellsPricazy.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/Prikaz.dart';

class prikazyView extends StatefulWidget {
  @override
  _prikazyViewPage createState() => _prikazyViewPage();
}

class _prikazyViewPage extends State<prikazyView> {
  Future<List<Prikaz>?>? dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = getAllPrikazes();
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
                      "Приказы",
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
                flex: 7,
                child: FutureBuilder<List<Prikaz>?>(
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
                      List<Prikaz>? prikazes = snapshot.data;
                      return ListView.builder(
                        itemCount: prikazes?.length ?? 0,
                        itemBuilder: (context, index) {
                          Prikaz prikaz = prikazes![index];
                          return CellsPricazy(
                            nomer: prikaz.nomer,
                            title: prikaz.title,
                            data: prikaz.date,
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


  Future<List<Prikaz>?>? getAllPrikazes() async {
    final storage = FlutterSecureStorage();
    String? accessToken = await storage.read(key: 'access_token');
    String? refreshToken = await storage.read(key: 'refresh_token');
    List<Prikaz> prikazes;

    var url_base = Uri.parse('https://api.sfu-kras.ru/api/v1/student/orders?page%5Bsize%5D=1&page%5Bnumber%5D=1');
    var headers = {'Authorization': 'Bearer $accessToken'};


    if (accessToken != null) {
      var response = await http.get(url_base, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponce = jsonDecode(response.body);
        var data = jsonResponce['meta'];
        var total = data['total'];

        var url_redirect = Uri.parse('https://api.sfu-kras.ru/api/v1/student/orders?page%5Bsize%5D=$total&page%5Bnumber%5D=1');
        response = await http.get(url_redirect, headers: headers);
        if (response.statusCode == 200) {
          jsonResponce = jsonDecode(response.body);
          var prikazesData = jsonResponce['data'];

          prikazes = prikazesData.map<Prikaz>((json) {
            var attributes = json['attributes'];
            return Prikaz(
              nomer: attributes['number'],
              title: attributes['title'],
              date: attributes['date'],
            );
          }).toList();

          return prikazes;
        }
      }
    }
    return null;
  }
}