import 'package:flutter/material.dart';

class InformationItem extends StatelessWidget {

  final IconData icon;
  final String category;
  final String value;

  InformationItem({this.icon, this.category, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blueGrey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  category,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.edit,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
