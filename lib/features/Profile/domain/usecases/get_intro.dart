import 'package:blog_app/features/Profile/domain/repositories/profile_repository.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/Profile/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';

class GetIntro {
  final ProfileRepository profileRepository;
  GetIntro({required this.profileRepository});

  Future<Either<Failure, ProfileEntity>> call() async {
    return await profileRepository.getIntroProfile();
  }
  
}
