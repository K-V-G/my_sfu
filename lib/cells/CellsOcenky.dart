import 'package:flutter/material.dart';

import '../views/courceInfo.dart';

class CellsOcenky extends StatefulWidget {
  final String title;
  final int id;

  CellsOcenky({
    required this.title, required this.id});

  @override
  _CellsOcenkyState createState() => _CellsOcenkyState();
}

class _CellsOcenkyState extends State<CellsOcenky> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => courceOcenkyInfo(title: widget.title, id: widget.id,),
              ),
            );
          },
          child:
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
        )),
        SizedBox(height: 20.0),
      ],
    );
  }
}
