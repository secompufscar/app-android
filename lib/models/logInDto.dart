import 'package:json_annotation/json_annotation.dart';

part 'logInDto.g.dart';

@JsonSerializable()
class LogInDto {
  const LogInDto({
    this.email = '',
    this.password = '',
  });

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$LogInDtoToJson(this);
}
