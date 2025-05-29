import 'package:blog_app/features/PostTest/domain/entities/sub_entities/user_entity.dart';

class PostEntity {
  final int id;
  final int userId;
  final String userName;
  final String content;
  final String profileImageUrl;
  final String imageUrl;
  final String createdAt;
  final int likeCount;
  final List<UserEntity> likedBy;
  

  PostEntity({
    required this.id,
    required this.userId,
    required this.userName,
    required this.content,
    required this.profileImageUrl,
    required this.imageUrl,
    required this.createdAt,
    required this.likeCount,
    required this.likedBy,
  });
}
