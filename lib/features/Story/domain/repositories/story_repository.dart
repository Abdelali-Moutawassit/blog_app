import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/Story/domain/entities/story_entity.dart';
import 'package:dartz/dartz.dart';

abstract class StoryRepository {
  Future<Either<Failure, List<StoryEntity>>> getStories();
}
