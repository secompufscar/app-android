import 'package:flutter/material.dart';
import 'package:app_secomp/routes/participante/information_item.dart';
import 'package:app_secomp/components/text_button.dart';

class UsuarioTabView extends StatelessWidget {

  final String _emailValue = "test@gmail.com";
  final String _nameValue = "João da Silva";
  final String _birthdayValue = "01/01/2001";
  final String _institueValue = "UFSCar";
  final String _courseVale = "Ciência da Computação";

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: <Widget>[
        InformationItem(
          category: "Email",
          value: _emailValue,
          icon: Icons.email,
        ),
        InformationItem(
          category: "Nome Completo",
          value: _nameValue,
          icon: Icons.person,
        ),
        InformationItem(
          category: "Data de Nascimento",
          value: _birthdayValue,
          icon: Icons.cake,
        ),
        InformationItem( 
          category: "Instituição",
          value: _institueValue,
          icon: Icons.domain,
        ),
        InformationItem(
          category: "Curso",
          value: _courseVale,
          icon: Icons.school,
        ),
        Divider(),
        TextButton(
          "Termos de Uso",
          icon: Icon(
            Icons.description,
            color: Colors.blueGrey,
          ),
          action: () {},
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        TextButton(
          "Sair",
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.red,
          ),
          action: () {},
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
