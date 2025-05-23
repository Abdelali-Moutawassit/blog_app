import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/errors/expentions.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/Story/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/Story/domain/entities/story_entity.dart';
import 'package:blog_app/features/Story/domain/repositories/story_repository.dart';
import 'package:dartz/dartz.dart';

class StoryRepositoryImpl implements StoryRepository {
  final NetworkInfo networkInfo;
  final RemoteDatasource remoteDatasource;

  StoryRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<StoryEntity>>> getStories() async {
    if (await networkInfo.isConnected!) {
      try {
        final stories = await remoteDatasource.getStories();
        return Right(stories);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      } catch (e) {
        return Left(
          Failure(errMessage: 'Une erreur inattendue est survenue : $e'),
        );
      }
    } else {
      return Left(Failure(errMessage: 'Aucune connexion Internet'));
    }
  }
}
