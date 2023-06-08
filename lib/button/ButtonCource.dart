import 'package:flutter/material.dart';

class ButtonCource extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isOrange;

  ButtonCource({required this.buttonText, required this.onPressed, required this.isOrange});

  @override
  _ButtonCourceState createState() => _ButtonCourceState();

}

class _ButtonCourceState extends State<ButtonCource> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: widget.onPressed,
          child: Text(widget.buttonText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.normal,
            ),),
        ),
          Align(alignment: Alignment.topCenter, child:
          Divider(height: 2,
          color: widget.isOrange ? Color(0xffEF5126) : Colors.white,
        ))
      ],
    );
  }
}