import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String text;
  final Function action;
  final TextStyle style;
  final Icon icon;
  final bool center;

  TextButton(this.text, {this.action, this.style, this.icon, this.center: false});

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

    Text textWidget = Text(
      text,
      style: realStyle,
    );

    Widget child;
    
    MainAxisAlignment alignment;
    if(center) alignment = MainAxisAlignment.center;
    else alignment = MainAxisAlignment.start;

    if (this.icon == null) {
      child = textWidget;
    } else {
      child = Row(
        mainAxisAlignment: alignment,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: textWidget,
          )
        ],
      );
    }

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
      onTap: action,
    );
  }
}
