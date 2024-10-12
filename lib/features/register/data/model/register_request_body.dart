import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  @JsonKey(name: 'Username')
  final String name;

  @JsonKey(name: 'Email')
  final String email;

  @JsonKey(name: 'Phone')
  final String phone;

  @JsonKey(name: 'Photo', fromJson: _stringToFile, toJson: _fileToString)
  final File? photo; 

  @JsonKey(name: 'Password')
  final String password;

  @JsonKey(name: 'Address')
  final String address;

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    this.photo,
    required this.address,
  });

  static String _fileToString(File? file) => file?.path ?? '';
  static File? _stringToFile(String? path) => path != null && path.isNotEmpty ? File(path) : null;

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
