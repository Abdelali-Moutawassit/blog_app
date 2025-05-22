import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/errors/expentions.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/Profile/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/Profile/domain/entities/profile_entity.dart';
import 'package:blog_app/features/Profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final RemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl({
    required this.remoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProfileEntity>> getIntroProfile() async {
    if (await networkInfo.isConnected!) {
      try {
        final profile = await remoteDatasource.getProfile();
        return Right(profile);
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
