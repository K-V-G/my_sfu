import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CellsPricazy extends StatefulWidget {
  final String nomer;
  final String title;
  final String data;

  CellsPricazy({required this.nomer,
    required this.title, required this.data});

  @override
  _CellsPricazyState createState() => _CellsPricazyState();
}

class _CellsPricazyState extends State<CellsPricazy> {
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
                    SvgPicture.asset('assets/image/nomer_pricaza.svg')),
                    Expanded(flex: 90, child:
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.nomer,
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
                      SvgPicture.asset('assets/image/calendar.svg')),
                  Expanded(flex: 90, child:
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          widget.data,
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
              ],
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
