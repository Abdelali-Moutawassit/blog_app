import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/Auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class Login {
  final AuthRepository authRepository;
  Login({required this.authRepository});

  Future<Either<Failure, Map<String, dynamic>>> call (
    String username,
    String password,
  ) async{
    return authRepository.login(username, password);
  }
}
