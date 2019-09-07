import 'dart:convert';

import 'package:app_secomp/models/membros.dart';

class Membro {
  String nome;
  String img;
  String bio;
  String diretoria;

  Membro({this.nome, this.img, this.bio, this.diretoria});
}

class Membros {
  List<Membro> list;

  Membros() {
    List<Membro> ret = [];
    String jsonString = MEMBROS;
    Map membros = json.decode(jsonString);
    membros.forEach((nomeDiretoria, membrosDiretoria) {
      membrosDiretoria.forEach((String nomeMembro, infoMembro) {
        ret.add(Membro(diretoria: nomeDiretoria, nome: nomeMembro, img: infoMembro['img'], bio:infoMembro['bio']));
      });
    });

    list = ret;
  }

  List<Membro> getDiretoria(String diretoria) {
    return list.where((membro) => membro.diretoria == diretoria).toList();
  }
}

