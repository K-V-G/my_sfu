import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CellsZachetkaView extends StatefulWidget {
  final String title;
  final String type;
  final String ocenka;

  CellsZachetkaView({required this.title,
                      required this.type, required this.ocenka});

  @override
  _cellsZachetkaState createState() => _cellsZachetkaState();
}

class _cellsZachetkaState extends State<CellsZachetkaView> {
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
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft, child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w400,
                    ),
                  ),),

              Align(alignment: Alignment.topLeft, child:
              Padding(padding: EdgeInsets.only(top: 5.0), child:
                  Row(
                  children: [
                  SvgPicture.asset('assets/image/exam_or_zachet_icons.svg'),
                  Text(widget.type == 'Экзамен' ? 'Экзамен' : 'Зачёт', style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w600,
                  ),),
                  ],
                  ))),
                  ],
                  ),
                  ),
                  ),

            Expanded(
              flex: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Align(
                  alignment: Alignment.center,
                  child:
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: getColorOnType(widget.type, widget.ocenka, 1),
                      borderRadius: BorderRadius.circular(10.0), // Установите радиус закругления
                    ),
                    child: Text(
                      widget.ocenka,
                      style: TextStyle(
                        color: getColorOnType(widget.type, widget.ocenka, 2),
                        fontSize: 16.0,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
            ))),
          ],
        ),
      ),
          SizedBox(height: 20.0),
        ],
      );

  }

  Color getColorOnType(String type, String ocenka, int id) {
    if (type == "Экзамен") {
      if (ocenka == "Отл") {
        if (id == 1) {
          return Color(0xffEDF7ED);
        }
        else if (id == 2) {
          return Color(0xff54B754);
        }
      }
      else if (ocenka == "Хор") {
        if (id == 1) {
          return Color(0xffCBCDFF);
        }
        else if (id == 2) {
          return Color(0xff000AFF);
        }
      }
      else if (ocenka == "Удовл") {
        if (id == 1) {
          return Color(0xffF8DBFB);
        }
        else if (id == 2) {
          return Color(0xffEB00FF);
        }
      }
      else if (ocenka == "Н/я") {
        if (id == 1) {
          return Color(0xffFAEBEB);
        }
        else if (id == 2) {
          return Color(0xffEB4351);
        }
      }
    }
      else if (type == "Зачет") {
        if (ocenka == "Зачёт" || ocenka == "Зачет") {
          if (id == 1) {
            return Color(0xffEDF7ED);
          }
          else if (id == 2) {
            return Color(0xff54B754);
          }
        }
        else if (ocenka == "Не зачёт" || ocenka == "Не зачет") {
          if (id == 1) {
            return Color(0xffFAEBEB);
          }
          else if (id == 2) {
            return Color(0xffEB4351);
          }
        }
        else if (ocenka == "Н/я") {
          if (id == 1) {
            return Color(0xffFAEBEB);
          }
          else if (id == 2) {
            return Color(0xffEB4351);
          }
        }
      }
      else if (type == "Практика") {
      if (ocenka == "Отл") {
        if (id == 1) {
          return Color(0xffEDF7ED);
        }
        else if (id == 2) {
          return Color(0xff54B754);
        }
      }
      else if (ocenka == "Хор") {
        if (id == 1) {
          return Color(0xffCBCDFF);
        }
        else if (id == 2) {
          return Color(0xff000AFF);
        }
      }
      else if (ocenka == "Удовл") {
        if (id == 1) {
          return Color(0xffF8DBFB);
        }
        else if (id == 2) {
          return Color(0xffEB00FF);
        }
      }
      else if (ocenka == "Н/я") {
        if (id == 1) {
          return Color(0xffFAEBEB);
        }
        else if (id == 2) {
          return Color(0xffEB4351);
        }
      }
    }
    else if (type == "Курсовой проект") {
      if (ocenka == "Отл") {
        if (id == 1) {
          return Color(0xffEDF7ED);
        }
        else if (id == 2) {
          return Color(0xff54B754);
        }
      }
      else if (ocenka == "Хор") {
        if (id == 1) {
          return Color(0xffCBCDFF);
        }
        else if (id == 2) {
          return Color(0xff000AFF);
        }
      }
      else if (ocenka == "Удовл") {
        if (id == 1) {
          return Color(0xffF8DBFB);
        }
        else if (id == 2) {
          return Color(0xffEB00FF);
        }
      }
      else if (ocenka == "Н/я") {
        if (id == 1) {
          return Color(0xffFAEBEB);
        }
        else if (id == 2) {
          return Color(0xffEB4351);
        }
      }
    }
    else if (type == "Курсовая работа") {
      if (ocenka == "Отл") {
        if (id == 1) {
          return Color(0xffEDF7ED);
        }
        else if (id == 2) {
          return Color(0xff54B754);
        }
      }
      else if (ocenka == "Хор") {
        if (id == 1) {
          return Color(0xffCBCDFF);
        }
        else if (id == 2) {
          return Color(0xff000AFF);
        }
      }
      else if (ocenka == "Удовл") {
        if (id == 1) {
          return Color(0xffF8DBFB);
        }
        else if (id == 2) {
          return Color(0xffEB00FF);
        }
      }
      else if (ocenka == "Н/я") {
        if (id == 1) {
          return Color(0xffFAEBEB);
        }
        else if (id == 2) {
          return Color(0xffEB4351);
        }
      }
    }
    return Colors.black;
  }
}
