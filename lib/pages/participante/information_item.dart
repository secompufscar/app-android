import 'package:flutter/material.dart';

class InformationItem extends StatefulWidget {
  final IconData icon;
  final String category;
  final String value;

  InformationItem({this.icon, this.category, this.value});

  @override
  _InformationItemState createState() => _InformationItemState();
}

class _InformationItemState extends State<InformationItem> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _actualValue;

  @override
  void initState() {
    _actualValue = widget.value;
    super.initState();
  }

  SimpleDialog _buildDialog(BuildContext context) {
    return SimpleDialog(
      title: Text(widget.category),
      contentPadding: EdgeInsets.all(16),
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _actualValue,
                onSaved: (String text) {
                  _actualValue = text;
                },
              ),
              MaterialButton(
                color: Colors.cyan,
                child: Text(
                  "Pronto".toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    _formKey.currentState.save();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _editField(BuildContext context) {
    showDialog(context: context, builder: (context) => _buildDialog(context));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.blueGrey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.category,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  _actualValue,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () => _editField(context),
            child: Icon(
              Icons.edit,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
