class CommentEntity {

  final int userId;
  final int postId;
  final String content;
  final String createdAt;
  final String profileImageUrl;

  CommentEntity({
    required this.userId,
    required this.postId,
    required this.content,
    required this.createdAt,
    required this.profileImageUrl
  });
}
