import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/Profile/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure,ProfileEntity>> getIntroProfile();
}