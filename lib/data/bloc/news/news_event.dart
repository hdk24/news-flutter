import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable{
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadTopHeadlines extends NewsEvent {
  final String category;

  const LoadTopHeadlines(this.category);

  @override
  List<Object> get props => [
    category
  ];
}