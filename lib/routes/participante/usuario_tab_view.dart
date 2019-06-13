import 'package:flutter/material.dart';
import 'package:app_secomp/routes/participante/information_item.dart';
import 'package:app_secomp/components/text_button.dart';

class UsuarioTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: <Widget>[
        InformationItem(
          category: "Email",
          value: "test@gmail.com",
          icon: Icons.email,
        ),
        InformationItem(
          category: "Nome Completo",
          value: "João da Silva",
          icon: Icons.person,
        ),
        InformationItem(
          category: "Data de Nascimento",
          value: "01/01/2001",
          icon: Icons.cake,
        ),
        InformationItem(
          category: "Instituição",
          value: "UFSCar",
          icon: Icons.domain,
        ),
        InformationItem(
          category: "Curso",
          value: "Ciência da Computação",
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
      ],
    );
  }
}
