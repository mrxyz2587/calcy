import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color colour;
  final String btnText;
  final Function calBack;

  Buttons({required this.colour, required this.btnText, required this.calBack});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => calBack(btnText),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints.tight(Size.fromRadius(30)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colour,
          ),
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
