import 'package:blog_app/features/PostTest/domain/entities/sub_entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  CommentModel({
    required super.userId,
    required super.content,
    required super.createdAt,
    required super.profileImageUrl,
    required super.userName,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      userId: json['userId'],
      content: json['content'],
      createdAt: json['createdAt'],
      profileImageUrl: json['profileImageUrl'],
      userName: json['userName'],
    );
  }
}
