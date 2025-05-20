import 'package:dartz/dartz.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/Post/domain/entities/post_entity.dart';

class GetPosts {
  final GetPosts getPosts;

  GetPosts({required this.getPosts});

  Future<Either<Failure, List<PostEntity>>> call() async {
    return getPosts.getPosts();
  }
}
