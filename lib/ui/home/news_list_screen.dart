import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsflutter/data/bloc/bloc.dart';
import 'package:newsflutter/data/data.dart';
import 'package:newsflutter/widget/widget.dart';

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(LoadTopHeadlines());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          if(state.response.totalResults >0){
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
          return Center(child: Text("Loading.. "));
        } else if (state is NewsError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(""));
        }
      },
    );
  }
}
