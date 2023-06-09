import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CellsSudentPlan extends StatefulWidget {
  final String type;
  final String title;
  final String cafedra;
  final String typeExam;
  final String timeLecture;
  final String timePrac;
  final String timeSam;

  CellsSudentPlan({required this.type,
    required this.title, required this.cafedra, required this.typeExam,
    required this.timeLecture,
    required this.timePrac, required this.timeSam,});

  @override
  _CellsSudentPlanState createState() => _CellsSudentPlanState();
}

class _CellsSudentPlanState extends State<CellsSudentPlan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(flex: 10, child:
                    SvgPicture.asset('assets/image/type_displina.svg')),
                    Expanded(flex: 90, child:
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.type,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      Expanded(flex: 10, child:
                      SvgPicture.asset('assets/image/nazvanie.svg')),
                      Expanded(flex: 90, child:
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      Expanded(flex: 10, child:
                      SvgPicture.asset('assets/image/institut_icons.svg')),
                      Expanded(flex: 90, child:
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          widget.cafedra,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      Expanded(flex: 10, child:
                      SvgPicture.asset('assets/image/exam_or_zachet_icons.svg')),
                      Expanded(flex: 90, child:
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          widget.typeExam,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: SvgPicture.asset('assets/image/time.svg'),
                      ),
                      Expanded(
                        flex: 90,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.timeLecture,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                widget.timePrac,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                widget.timeSam,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
