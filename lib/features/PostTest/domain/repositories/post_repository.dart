import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
}
