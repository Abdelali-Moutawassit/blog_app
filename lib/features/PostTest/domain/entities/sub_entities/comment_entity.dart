class CommentEntity {
  final int userId;
  final String content;
  final String createdAt;
  final String profileImageUrl;
  final String userName;

  CommentEntity({
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.profileImageUrl,
    required this.userName,
  });
}
