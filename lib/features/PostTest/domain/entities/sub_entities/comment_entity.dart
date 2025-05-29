class CommentEntity {

  final int userId;
  final String content;
  final String createdAt;
  final String profileImageUrl;

  CommentEntity({
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.profileImageUrl
  });
}
