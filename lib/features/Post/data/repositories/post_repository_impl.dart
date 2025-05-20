import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/errors/expentions.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/Post/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/Post/domain/entities/post_entity.dart';
import 'package:blog_app/features/Post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl implements PostRepository {
  final NetworkInfo networkInfo;
  final RemoteDatasource remoteDatasource;

  PostRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    if (await networkInfo.isConnected!) {
      try {
        final posts = await remoteDatasource.getPosts();
        return Right(posts);
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
