import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

class NoticiaRepository {
  Future<List<Noticia>> getNoticias() async {
    final _result = await Firestore.instance
        .collection('noticias')
        .orderBy("time", descending: true)
        .getDocuments();
    final _value = _result.documents
        .map((snapshot) => Noticia.fromMap(snapshot.data))
        .toList();

    return _value;
  }
}
