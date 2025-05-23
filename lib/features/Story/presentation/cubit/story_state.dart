part of 'story_cubit.dart';

sealed class StoryState extends Equatable {
  const StoryState();
}

final class StoryLoading extends StoryState {
  @override
  List<Object> get props => [];
}

final class StoryLoaded extends StoryState {
  final List<StoryEntity> stories;
  const StoryLoaded({required this.stories});
  @override
  List<Object> get props => [stories];
}

final class StoryFailure extends StoryState {
  final String errorMessage;
  const StoryFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
