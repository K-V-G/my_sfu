import 'package:flutter/material.dart';

class ocenkyCourceInfo extends StatefulWidget {
  final String title;
  final double minZnach;
  final double maxZnach;
  final double tecZnach;


  ocenkyCourceInfo({required this.title,
    required this.minZnach, required this.maxZnach, required this.tecZnach});

  @override
  _ocenkyCourceInfoState createState() => _ocenkyCourceInfoState();
}

class _ocenkyCourceInfoState extends State<ocenkyCourceInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 50,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                  child:
                  Expanded(flex: 100, child:
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),

                ),
              ),

              Expanded(
                  flex: 50,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Align(
                          alignment: Alignment.center,
                          child:
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(flex: 50, child: Text(
                                            "Оценка",
                                            style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            fontFamily: 'Ubuntu',
                                            fontWeight: FontWeight.w600,
                                            ),
                                            ),),
                                      Expanded(flex: 50, child:
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: getColorOnType(widget.maxZnach,
                                              widget.tecZnach, 1),
                                          borderRadius: BorderRadius.circular(10.0), // Установите радиус закругления
                                        ),
                                        child: Text(
                                          widget.tecZnach.toString(),
                                          style: TextStyle(
                                            color: getColorOnType(widget.maxZnach,
                                                widget.tecZnach, 2),
                                            fontSize: 16.0,
                                            fontFamily: 'Ubuntu',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                      children: [
                                        Expanded(flex: 50, child: Text(
                                          "Диапазон",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            fontFamily: 'Ubuntu',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),),
                                        Expanded(flex: 50, child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0xffD9D9D9),
                                            borderRadius: BorderRadius.circular(10.0), // Установите радиус закругления
                                          ),
                                          child: Text(
                                            "${widget.minZnach.toString()} - ${widget.maxZnach.toString()}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Ubuntu',
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),),
                                      ],
                                  )
                                ],
                              )

                      ))),
            ],
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );

  }

  Color getColorOnType(double maxZnach, double tecZnach, int id) {
    double coef = tecZnach / maxZnach;

    if (coef >= 0.8) {
      if (id == 1) {
        return Color(0xffEDF7ED);
      }
      else if (id == 2) {
        return Color(0xff54B754);
      }
    }
      else if (coef >= 0.6 && coef < 0.8) {
        if (id == 1) {
          return Color(0xffCBCDFF);
        }
        else if (id == 2) {
          return Color(0xff000AFF);
        }
      }
      else if (coef >= 0.4 && coef < 0.6 ) {
        if (id == 1) {
          return Color(0xffF8DBFB);
        }
        else if (id == 2) {
          return Color(0xffEB00FF);
        }
      }
      else {
      if (id == 1) {
        return Color(0xffFAEBEB);
      }
      else if (id == 2) {
        return Color(0xffEB4351);
      }
    }
    return Colors.black;
  }
}
