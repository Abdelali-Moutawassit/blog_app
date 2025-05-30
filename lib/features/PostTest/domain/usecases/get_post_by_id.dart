import 'package:blog_app/features/PostTest/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';

class GetPostById {
  final PostRepository postRepository;

  GetPostById({required this.postRepository});

  Future<Either<Failure, PostEntity>> call(int id) async {
    return postRepository.getPostsById(id);
  }
}
