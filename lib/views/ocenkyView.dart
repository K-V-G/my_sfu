import 'package:flutter/material.dart';
import 'package:my_sfu/models/Ocenky.dart';

import '../cells/CellsOcenky.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ocenkyView extends StatefulWidget {

  @override
  _ocenkyViewPage createState() => _ocenkyViewPage();
}

class _ocenkyViewPage extends State<ocenkyView> {
  Future<List<Ocenky>?>? dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = getAllOCenky();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  FutureBuilder<void>(
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
                      "Оценки",
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
                child: FutureBuilder<List<Ocenky>?>(
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
                      List<Ocenky>? ocenki = snapshot.data;
                      return ListView.builder(
                        itemCount: ocenki?.length ?? 0,
                        itemBuilder: (context, index) {
                          Ocenky ocenky = ocenki![index];
                          return CellsOcenky(
                            title: ocenky.title,
                            id: ocenky.id,
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


  Future<List<Ocenky>?>? getAllOCenky() async {
    final storage = FlutterSecureStorage();
    String? accessToken = await storage.read(key: 'access_token');
    String? refreshToken = await storage.read(key: 'refresh_token');
    List<Ocenky> ocenky;

    var url_base = Uri.parse('https://api.sfu-kras.ru/api/v1/student/elearning/courses?page%5Bsize%5D=1&page%5Bnumber%5D=1');
    var headers = {'Authorization': 'Bearer $accessToken'};


    if (accessToken != null) {
      var response = await http.get(url_base, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponce = jsonDecode(response.body);
        var data = jsonResponce['meta'];
        var page = data['page'];
        var total = page['total'];

        var url_redirect = Uri.parse('https://api.sfu-kras.ru/api/v1/student/elearning/courses?page%5Bsize%5D=$total&page%5Bnumber%5D=1');
        response = await http.get(url_redirect, headers: headers);
        if (response.statusCode == 200) {
          jsonResponce = jsonDecode(response.body);
          var prikazesData = jsonResponce['data'];

          ocenky = prikazesData.map<Ocenky>((json) {
            var attributes = json['attributes'];
            return Ocenky(
              id: json['id'],
              title: attributes['name'],
            );
          }).toList();

          return ocenky;
        }
      }
    }
    return null;
  }
}