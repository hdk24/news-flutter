import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsflutter/common/styles/styles.dart';
import 'package:newsflutter/data/data.dart';
import 'package:newsflutter/ui/home/news_list_screen.dart';
import 'package:newsflutter/utils/app_constant.dart';

class ScreenArguments {
  final String title;

  ScreenArguments(this.title);
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  final String title;

  const HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<NewsListScreenState> _key = GlobalKey<NewsListScreenState>();

  TabController _tabController;
  int _currentIndex = 0;

  List<Tab> _tabList() {
    List<Tab> tab = <Tab>[];
    for (int i = 0; i < AppConstant.categoryList().length; i++) {
      tab.add(Tab(text: AppConstant.categoryList()[i]));
    }
    return tab;
  }

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
      _key.currentState.updateState(AppConstant.categoryList()[_currentIndex]);
      print("Hdk tab select ${AppConstant.categoryList()[_currentIndex]}");
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _tabList().length);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _tabBarView = TabBar(
      isScrollable: true,
      labelColor: ColorPalettes.red,
      unselectedLabelColor: ColorPalettes.lightTextSecondary,
      indicatorColor: Colors.transparent,
      controller: _tabController,
      labelStyle: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Family Name',
        fontWeight: FontWeight.w600,
      ),
      tabs: _tabList(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: AppTheme.titleBarStyle),
        bottom: _tabBarView,
        centerTitle: true,
        elevation: 1.0,
      ),
      body: BlocProvider(
        create: (context) => NewsBloc(NewsRepositoryImpl()),
        child: NewsListScreen(
          key: _key,
          category: AppConstant.categoryList()[_currentIndex],
        ),
      ),
    );
  }
}
