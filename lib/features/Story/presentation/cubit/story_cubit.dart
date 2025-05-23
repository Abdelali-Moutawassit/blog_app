import 'package:bloc/bloc.dart';
import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/databases/api/dio_consumer.dart';
import 'package:blog_app/features/Story/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/Story/data/repositories/story_repository_impl.dart';
import 'package:blog_app/features/Story/domain/entities/story_entity.dart';
import 'package:blog_app/features/Story/domain/usecases/get_stories.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryLoading());

  eitherFailureOrStories() async {
    emit(StoryLoading());

    final failureOrStories =
        await GetStories(
          storyRepository: StoryRepositoryImpl(
            networkInfo: NetworkInfoImpl(InternetConnectionChecker.instance),
            remoteDatasource: RemoteDatasource(api: DioConsumer(dio: Dio())),
          ),
        ).call();

    failureOrStories.fold(
      (failure) => emit(StoryFailure(errorMessage: failure.errMessage)),
      (stories) => emit(StoryLoaded(stories: stories)),
    );
  }
}
