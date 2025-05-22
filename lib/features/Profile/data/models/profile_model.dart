import 'package:blog_app/features/Profile/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.id,
    required super.email,
    required super.username,
    required super.phone,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'username': username, 'phone': phone};
  }
}
