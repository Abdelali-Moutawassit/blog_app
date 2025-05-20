part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginLoding extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginSuccess extends LoginState {
  final String successMessage;
  const LoginSuccess({required this.successMessage});

  @override
  List<Object> get props => [successMessage];
}

final class LoginFailure extends LoginState {
  final String errorMessage;
  const LoginFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
