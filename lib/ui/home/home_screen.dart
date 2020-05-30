import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsflutter/data/data.dart';
import 'package:newsflutter/ui/home/news_list_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) {
          return NewsBloc(NewsRepositoryImpl());
        },
        child: NewsListScreen(),
      ),
    );
  }
}

