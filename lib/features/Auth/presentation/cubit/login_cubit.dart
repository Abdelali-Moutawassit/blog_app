import 'package:bloc/bloc.dart';
import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/databases/api/dio_consumer.dart';
import 'package:blog_app/features/Auth/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/Auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/Auth/domain/usecases/login.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  eitherErrorOrSuccess(String username,String password) async {
    emit(LoginLoding());
    final errorOrSuccess = await Login(
      authRepository: AuthRepositoryImpl(
        networkInfo: NetworkInfoImpl(InternetConnectionChecker.instance),
        remteDatasource: RemteDatasource(api: DioConsumer(dio: Dio())),
      ),
    ).call(username, password);

    errorOrSuccess.fold(
      (error) => emit(LoginFailure(errorMessage: error.errMessage)),
      (success) => emit(LoginSuccess(successMessage: success.toString())),
    );
  }
}
