import 'package:equatable/equatable.dart';

sealed class AddCommentState extends Equatable {
  const AddCommentState();

  @override
  List<Object> get props => [];
}

final class AddCommentInitial extends AddCommentState {}

final class AddCommentLoading extends AddCommentState {}

final class AddCommentSuccess extends AddCommentState {}

final class AddCommentFailure extends AddCommentState {
  final String message;

  const AddCommentFailure({required this.message});

  @override
  List<Object> get props => [message];
}
