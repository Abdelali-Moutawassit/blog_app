import 'package:bloc/bloc.dart';
import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/databases/api/dio_consumer.dart';
import 'package:blog_app/features/Post/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/Post/data/repositories/post_repository_impl.dart';
import 'package:blog_app/features/Post/domain/entities/post_entity.dart';
import 'package:blog_app/features/Post/domain/usecases/get_posts.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoading());

  eitherFailureOrPosts() async {
    emit(PostLoading());
    final failureOrPost =
        await GetPosts(
          postRepository: PostRepositoryImpl(
            networkInfo: NetworkInfoImpl(InternetConnectionChecker.instance),
            remoteDatasource: RemoteDatasource(api: DioConsumer(dio: Dio())),
          ),
        ).call();

    failureOrPost.fold(
      (failure) => emit(PostFailure(message: failure.errMessage)),
      (posts) => emit(PostLoaded(posts: posts)),
    );
  }
}
