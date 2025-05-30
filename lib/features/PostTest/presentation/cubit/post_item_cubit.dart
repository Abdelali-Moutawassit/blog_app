import 'package:bloc/bloc.dart';
import 'package:blog_app/core/connection/network_info.dart';
import 'package:blog_app/core/databases/api/dio_consumer.dart';
import 'package:blog_app/features/PostTest/data/datasources/remote_datasource.dart';
import 'package:blog_app/features/PostTest/data/repositories/post_repository_impl.dart';
import 'package:blog_app/features/PostTest/domain/entities/post_entity.dart';
import 'package:blog_app/features/PostTest/domain/usecases/get_post_by_id.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'post_item_state.dart';

class PostItemCubit extends Cubit<PostItemState> {
  PostItemCubit() : super(PostItemLoading());

  eitherFailureOrPosts(int id) async {
    emit(PostItemLoading());
    final failureOrPost =
        await GetPostById(
          postRepository: PostRepositoryImpl(
            networkInfo: NetworkInfoImpl(InternetConnectionChecker.instance),
            remoteDatasource: RemoteDatasource(api: DioConsumer(dio: Dio())),
          ),
        ).call(id);

    failureOrPost.fold(
      (failure) => emit(PostItemFailure(message: failure.errMessage)),
      (post) => emit(PostItemLoaded(post: post)),
    );
  }
}
