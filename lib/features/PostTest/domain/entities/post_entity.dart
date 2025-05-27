class PostEntity {

  final int id;
  final int userId;
  final String userName;
  final String content;
  final String imageUrl;
  final String createdAt;
  final int likeCount;
  

  PostEntity({required this.id,required this.userId,required this.userName,required this.content,required this.imageUrl,required this.createdAt,required this.likeCount});
}
