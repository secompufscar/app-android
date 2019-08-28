import 'package:flutter/material.dart';

class SelectCircle extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String text;
  final bool selected;

  SelectCircle({this.color, this.icon, this.text, this.selected});
  @override
  _SelectCircleState createState() => _SelectCircleState();
}

class _SelectCircleState extends State<SelectCircle> {
  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.color;
    Color textColor = widget.color;
    Color iconColor = widget.color;
    Color backgroundColor = Colors.transparent;

    if (widget.selected) {
      borderColor = Colors.transparent;
      textColor = Colors.white;
      iconColor = Colors.white;
      backgroundColor = widget.color;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: <Widget>[
              Icon(
                widget.icon,
                color: iconColor,
              ),
              Text(
                widget.text,
                style: TextStyle(color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
