import 'package:blog_app/features/PostTest/domain/entities/sub_entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.fullName,
    required super.username,
    required super.email,
    required super.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      username: json['username'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
    );
  }


}
