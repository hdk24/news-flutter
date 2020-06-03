import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsflutter/data/bloc/bloc.dart';
import 'package:newsflutter/data/data.dart';
import 'package:newsflutter/widget/widget.dart';

class NewsListScreen extends StatefulWidget {
  final String category;

  const NewsListScreen({Key key, this.category}) : super(key: key);

  @override
  NewsListScreenState createState() => NewsListScreenState();
}

class NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    updateState(widget.category);
  }

  void updateState(String category) {
    BlocProvider.of<NewsBloc>(context).add(LoadTopHeadlines(category));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          if (state.response.totalResults > 0) {
            return ListView.builder(
              itemCount: state.response.articles.length,
              itemBuilder: (context, index) {
                Articles _articles = state.response.articles[index];
                if (index == 0) {
                  return TopNews(
                      poster: _articles.urlToImage,
                      title: _articles.title,
                      source: _articles.source.name);
                } else {
                  return NewsItem(_articles);
                }
              },
            );
          } else {
            return Center(child: Text("No Result."));
          }
        } else if (state is NewsLoading) {
          return ShimmerNews();
        } else if (state is NewsError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(""));
        }
      },
    );
  }
}
