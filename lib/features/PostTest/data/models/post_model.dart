import 'package:blog_app/features/PostTest/data/models/sub_models/comment_model.dart';
import 'package:blog_app/features/PostTest/data/models/sub_models/user_model.dart';
import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.id,
    required super.userId,
    required super.userName,
    required super.content,
    required super.profileImageUrl,
    required super.imageUrl,
    required super.createdAt,
    required super.likeCount,
    required super.likedBy,
    required super.comments
  });

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      userId: map['userId'],
      userName: map['userName'],
      content: map['content'],
      profileImageUrl: map['profileImageUrl'],
      imageUrl: map['imageUrl'],
      createdAt: map['createdAt'],
      likeCount: map['likeCount'],
      likedBy: (map['likedBy'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList(),
      comments: (map['comments'] as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userId, 'userName': userName, 'content': content,'profileImageUrl': profileImageUrl,'imageUrl':imageUrl, 'createdAt':createdAt,'likeCount':likeCount, 'likedBy':likedBy};
  }
}
