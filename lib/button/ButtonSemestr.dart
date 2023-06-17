import 'package:flutter/material.dart';

class ButtonSemestr extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isOrange;

  ButtonSemestr({required this.buttonText, required this.onPressed, required this.isOrange});

  @override
  _ButtonSemestrState createState() => _ButtonSemestrState();
}

class _ButtonSemestrState extends State<ButtonSemestr> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.isOrange ? Color(0xffEF5126) : Color(0xffD9D9D9),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: TextButton(
            onPressed: widget.onPressed,
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: widget.isOrange ? Color(0xffEF5126) : Color(0xffD9D9D9),
                fontSize: 14.0,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),

      ],
    );
  }
}