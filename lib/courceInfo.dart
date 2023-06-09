import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cells/ocenkyInfoCource.dart';

class courceOcenkyInfo extends StatefulWidget {
  final String title;

  courceOcenkyInfo({required this.title});

  @override
  _courceOcenkyInfoState createState() => _courceOcenkyInfoState();
}

class _courceOcenkyInfoState extends State<courceOcenkyInfo> {
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
                  child: Row(
                    children: [
                      Expanded(flex: 20, child: Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 10.0) ,
                          child: InkWell(onTap: () {
                            Navigator.pop(context);
                          },
                              child: Align(alignment: Alignment.topCenter,
                                  child: SvgPicture.asset("assets/image/strelka_nazad.svg"))))),
                      Expanded(flex: 80, child:  Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
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
                  flex: 7,
                  child:Row(
                    children: [
                      Expanded(flex: 100, child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          ocenkyCourceInfo(
                            title: 'Разработать стратегии работы с заинтересованными сторонами',
                            minZnach: 0,
                            maxZnach: 100,
                            tecZnach: 50,
                          ),
                          ocenkyCourceInfo(
                            title: 'Разработать план управления коммуникациями',
                            minZnach: 0,
                            maxZnach: 100,
                            tecZnach: 5,
                          ),
                          ocenkyCourceInfo(
                            title: 'Разработать стратегии работы с заинтересованными сторонами',
                            minZnach: 0,
                            maxZnach: 100,
                            tecZnach: 100,
                          ),
                          ocenkyCourceInfo(
                            title: 'Разработать стратегии работы с заинтересованными сторонами',
                            minZnach: 0,
                            maxZnach: 5,
                            tecZnach: 3,
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