import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.id,
    required super.userId,
    required super.userName,
    required super.content,
    required super.imageUrl,
    required super.createdAt,
    required super.likeCount,
  });

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      userId: map['userId'],
      userName: map['userName'],
      content: map['content'],
      imageUrl: map['imageUrl'],
      createdAt: map['createdAt'],
      likeCount: map['likeCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userId, 'userName': userName, 'content': content,'imageUrl':imageUrl, 'createdAt':createdAt,'likeCount':likeCount};
  }
}
