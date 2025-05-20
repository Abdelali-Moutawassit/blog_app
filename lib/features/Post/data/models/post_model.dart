import 'package:blog_app/features/Post/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.id,
    required super.title,
    required super.body,
    required super.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body, 'userId': userId};
  }
}
