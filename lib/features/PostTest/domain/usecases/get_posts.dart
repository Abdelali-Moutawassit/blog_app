import 'package:blog_app/features/PostTest/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';

class GetPosts {
  final PostRepository postRepository;

  GetPosts({required this.postRepository});

  Future<Either<Failure, List<PostEntity>>> call() async {
    return postRepository.getPosts();
  }
}
