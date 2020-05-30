import 'package:equatable/equatable.dart';
import 'package:newsflutter/data/data.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class InitialNewsState extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final BaseResponse response;

  const NewsLoaded([this.response]);

  @override
  List<Object> get props => [response];
}

class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'NewsError { error: $message }';
}
