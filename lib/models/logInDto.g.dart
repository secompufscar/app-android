// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logInDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInDto _$LogInDtoFromJson(Map<String, dynamic> json) {
  return LogInDto(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LogInDtoToJson(LogInDto instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
