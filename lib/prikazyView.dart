import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class prikazyView extends StatefulWidget {
  @override
  _prikazyViewPage createState() => _prikazyViewPage();
}

class _prikazyViewPage extends State<prikazyView> {
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
              Expanded(flex: 7, child: Text("")),
            ],
          ),
        ],
      ),
    );
  }
}