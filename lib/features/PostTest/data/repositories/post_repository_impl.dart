import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/errors/expentions.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/PostTest/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';
import 'package:blog_app/features/PostTest/domain/repositories/post_repository.dart';
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

  @override
  Future<Either<Failure, Unit>> addReactionToPost({
    required int postId,
    required int userId,
    required String reactionType,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        await remoteDatasource.addReactionToPost(
          postId: postId,
          userId: userId,
          reactionType: reactionType,
        );
        return const Right(unit);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      } catch (e) {
        return Left(Failure(errMessage: 'Erreur inattendue : $e'));
      }
    } else {
      return Left(Failure(errMessage: 'Pas de connexion Internet'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addCommentToPost({
    required int postId,
    required int userId,
    required String content,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        await remoteDatasource.addCommentToPost(
          postId: postId,
          userId: userId,
          content: content,
        );
        return const Right(unit);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      } catch (e) {
        return Left(Failure(errMessage: 'Erreur inattendue : $e'));
      }
    } else {
      return Left(Failure(errMessage: 'Pas de connexion Internet'));
    }
  }
  
  @override
  Future<Either<Failure, PostEntity>> getPostsById(int id) async{
    if (await networkInfo.isConnected!) {
      try {
        final post = await remoteDatasource.getPostsById(id);
        return Right(post);
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
