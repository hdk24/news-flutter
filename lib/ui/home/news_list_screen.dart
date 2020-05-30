import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsflutter/data/bloc/bloc.dart';

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
          return Center(child: Text("Loaded ${state.response.totalResults} data"));
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
