import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Noticia {
  final String content;
  final DateTime date;

  Noticia(this.content, this.date);

  factory Noticia.fromMap(Map<String, dynamic> json) {
    return Noticia(
      json['text'] as String,
      json['time'] == null ? null : (json['time'] as Timestamp).toDate(),
    );
  }
}
