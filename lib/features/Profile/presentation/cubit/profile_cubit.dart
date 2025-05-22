import 'package:bloc/bloc.dart';
import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/databases/api/dio_consumer.dart';
import 'package:blog_app/features/Profile/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/Profile/data/repositories/profile_repository_impl.dart';
import 'package:blog_app/features/Profile/domain/entities/profile_entity.dart';
import 'package:blog_app/features/Profile/domain/usecases/get_intro.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileLoading());

  eitherFailureOrProfile() async {
    emit(ProfileLoading());
    final failureOrProfile =
        await GetIntro(
          profileRepository: ProfileRepositoryImpl(
            remoteDatasource: RemoteDatasource(api: DioConsumer(dio: Dio())),
            networkInfo: NetworkInfoImpl(InternetConnectionChecker.instance),
          ),
        ).call();

    failureOrProfile.fold(
      (failure)=>emit(ProfileFailure(failureMessage: failure.errMessage)), 
      (profile)=>emit(ProfileLoaded(profileEntity: profile)));
  }
}
