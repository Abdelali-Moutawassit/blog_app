import 'package:dartz/dartz.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/PostTest/domain/repositories/post_repository.dart';

class AddReactionToPostUseCase {
  final PostRepository repository;

  AddReactionToPostUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required int postId,
    required int userId,
    required String reactionType,
  }) {
    return repository.addReactionToPost(
      postId: postId,
      userId: userId,
      reactionType: reactionType,
    );
  }
}
