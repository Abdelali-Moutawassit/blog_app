part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  const PostState();
}

final class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

final class PostLoaded extends PostState {
  final List<PostEntity> posts;
  const PostLoaded({required this.posts});

  @override
  List<Object?> get props => [posts];
}

final class PostFailure extends PostState {
  final String message;

  const PostFailure({required this.message});

  @override
  List<Object> get props => [message];
}
