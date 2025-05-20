import 'package:blog_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> login(String username, String password);
}
