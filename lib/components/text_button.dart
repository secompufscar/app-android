import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String text;
  final Function action;
  final TextStyle style;

  TextButton(this.text, {this.action, this.style});

  @override
  Widget build(BuildContext context) {
    TextStyle realStyle;

    if (this.style == null) {
      realStyle = TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
      );
    } else {
      realStyle = this.style;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: realStyle,
        ),
      ),
      onTap: action,
    );
  }
}
