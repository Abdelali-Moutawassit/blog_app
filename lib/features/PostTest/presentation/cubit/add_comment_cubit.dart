import 'package:bloc/bloc.dart';
import 'package:blog_app/features/PostTest/domain/usecases/add_comment.dart';
import 'package:blog_app/features/PostTest/presentation/cubit/add_comment_state.dart';
import 'package:equatable/equatable.dart';


class AddCommentCubit extends Cubit<AddCommentState> {
  final AddCommentToPostUseCase addCommentUseCase;

  AddCommentCubit({required this.addCommentUseCase}) : super(AddCommentInitial());

  Future<void> addAddComment({
    required int postId,
    required int userId,
    required String content,
  }) async {
    emit(AddCommentLoading());

    final result = await addCommentUseCase.call(
      postId: postId,
      userId: userId,
      content: content
    );

    result.fold(
      (failure) => emit(AddCommentFailure(message: failure.errMessage)),
      (_) => emit(AddCommentSuccess()),
    );
  }
}
