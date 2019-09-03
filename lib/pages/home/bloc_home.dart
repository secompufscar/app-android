import 'package:app_secomp/models/noticia.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlocHome extends BlocBase {
  List<Noticia> noticias;
  final noticiasController = BehaviorSubject<List<Noticia>>.seeded([]);
  Stream<List<Noticia>> get outNoticias => noticiasController.stream;
  Sink<List<Noticia>> get inNoticias => noticiasController.sink;

  // Future<bool> loadNoticias() async {
  //   try {
  //     final snapshot = Firestore.instance
  //         .collection('noticias')
  //         .orderBy("time", descending: true)
  //         .snapshots();
  //     print("passou aqui");
  //     print(snapshot);
  //     List<Noticia> temp = [];
  //     snapshot.listen((data) {
  //       data.documents.forEach(
  //         (doc) => temp.add(
  //           Noticia(
  //             doc["text"].toString(),
  //             doc["time"].toDate(),
  //           ),
  //         ),
  //       );
  //     });

  //     inNoticias.add(noticiasController.value = temp);
  //     print("acabou");
  //     return Future.value(true);
  //   } catch (e) {
  //     return Future.value(false);
  //   }
  // }

  Future<bool> loadNoticias() async {
    try {
      List<Noticia> temp = [];
      await Firestore.instance
          .collection('noticias')
          .orderBy("time", descending: true)
          .getDocuments()
          .then(
            (data) => data.documents.forEach(
              (doc) => temp.add(
                Noticia(
                  doc["text"].toString(),
                  doc["time"].toDate(),
                ),
              ),
            )
          );

      inNoticias.add(noticiasController.value = temp);
      print("acabou");
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  void dispose() {
    noticiasController.close();
    super.dispose();
  }
}
