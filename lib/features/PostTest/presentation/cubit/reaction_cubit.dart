import 'package:bloc/bloc.dart';
import 'package:blog_app/features/PostTest/domain/usecases/add_reaction.dart';
import 'package:equatable/equatable.dart';


part 'reaction_state.dart';

class ReactionCubit extends Cubit<ReactionState> {
  final AddReactionToPostUseCase addReactionUseCase;

  ReactionCubit({required this.addReactionUseCase}) : super(ReactionInitial());

  Future<void> addReaction({
    required int postId,
    required int userId,
    required String reactionType,
  }) async {
    emit(ReactionLoading());

    final result = await addReactionUseCase.call(
      postId: postId,
      userId: userId,
      reactionType: reactionType,
    );

    result.fold(
      (failure) => emit(ReactionFailure(message: failure.errMessage)),
      (_) => emit(ReactionSuccess()),
    );
  }
}
