import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/Story/domain/entities/story_entity.dart';
import 'package:blog_app/features/Story/domain/repositories/story_repository.dart';
import 'package:dartz/dartz.dart';

class GetStories {
  final StoryRepository storyRepository;
  GetStories({required this.storyRepository});

  Future<Either<Failure, List<StoryEntity>>> call() async {
    return await storyRepository.getStories();
  }
}
