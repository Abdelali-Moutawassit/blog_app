import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/errors/expentions.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/Auth/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/Auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo networkInfo;
  final RemteDatasource remteDatasource;

  AuthRepositoryImpl({
    required this.networkInfo,
    required this.remteDatasource,
  });

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
    String username,
    String password,
  ) async {
    if (await networkInfo.isConnected!) {
      try {
        Map<String, dynamic> token = await remteDatasource.login(
          username,
          password,
        );
        return Right(token);
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
