import 'package:blog_app/features/PostTest/domain/entities/sub_entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  CommentModel({
    required super.userId,
    required super.postId,
    required super.content,
    required super.createdAt,
    required super.profileImageUrl,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      userId: json['userId'],
      postId: json['postId'],
      content: json['content'],
      createdAt: json['createdAt'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
