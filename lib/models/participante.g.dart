// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participante.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Participante _$ParticipanteFromJson(Map<String, dynamic> json) {
  return Participante(
    id: json['uuid'] as String,
    primeiroNome: json['primeiro_nome'] as String,
    sobrenome: json['sobrenome'] as String,
    camisetas: (json['camiseta'] as List)?.map((e) => e as String)?.toList(),
    presencas: (json['presencas'] as List)?.map((e) => e as String)?.toList(),
    pontos: json['pontuacao'] as int,
  );
}

Map<String, dynamic> _$ParticipanteToJson(Participante instance) =>
    <String, dynamic>{
      'uuid': instance.id,
      'primeiro_nome': instance.primeiroNome,
      'sobrenome': instance.sobrenome,
      'camiseta': instance.camisetas,
      'presencas': instance.presencas,
      'pontuacao': instance.pontos,
    };
