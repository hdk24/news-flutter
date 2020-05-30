import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsflutter/data/bloc/news/news_event.dart';
import 'package:newsflutter/data/bloc/news/news_state.dart';
import 'package:newsflutter/data/repository/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc(this.repository);

  @override
  NewsState get initialState => InitialNewsState();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadTopHeadlines) {
      yield* _mapLoadTopHeadlinesToState();
    }
  }

  Stream<NewsState> _mapLoadTopHeadlinesToState() async* {
    try {
      yield NewsLoading();
      var newsResponse = await repository.getTopHeadline();
      yield NewsLoaded(newsResponse);
    } catch (e) {
      yield NewsError(e.toString());
    }
  }
}
