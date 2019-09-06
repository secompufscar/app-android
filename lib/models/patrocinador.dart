import 'package:app_secomp/models/list_patrocinadores.dart';

class Patrocinador {
  String nome;
  String img;
  String cota;

  Patrocinador({this.nome, this.img, this.cota});
}

class Patrocinadores {
  List<Patrocinador> list;

  Patrocinadores() {
    List<Patrocinador> ret = [];
    List<Map<String,dynamic>> patrocinadores = PATROCINADORES;
    patrocinadores.forEach((patrocinador) {
      ret.add(Patrocinador(cota: patrocinador['cota'], img: patrocinador['logo'], nome: patrocinador['nome']));
    });
   

    list = ret;
  }

  List<Patrocinador> getCota(String cota) {
    return list.where((patrocinador) => patrocinador.cota == cota).toList();
  }
}

