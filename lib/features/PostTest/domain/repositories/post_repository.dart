import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, Unit>> addReactionToPost({
    required int postId,
    required int userId,
    required String reactionType,
  });
  Future<Either<Failure, Unit>> addCommentToPost({
    required int postId,
    required int userId,
    required String content,
  });
}
