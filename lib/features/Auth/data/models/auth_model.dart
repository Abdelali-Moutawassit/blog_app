import 'package:blog_app/features/Auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.id,
    required super.email,
    required super.username,
    required super.password,
    required super.phone,
  });

  factory AuthModel.fromJson(Map<String, dynamic> map) {
    return AuthModel(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      password: map['password'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'phone': phone,
    };
  }
}
