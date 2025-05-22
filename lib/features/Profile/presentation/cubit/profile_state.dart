part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLoaded extends ProfileState {
  final ProfileEntity profileEntity;

  ProfileLoaded({required this.profileEntity});

  @override
  List<Object> get props => [profileEntity];
}

final class ProfileFailure extends ProfileState {
  final String failureMessage;

  ProfileFailure({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];
}
