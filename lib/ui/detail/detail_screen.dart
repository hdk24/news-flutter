import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/styles/styles.dart';
import 'package:newsflutter/data/data.dart';
import 'package:newsflutter/ui/main.dart';
import 'package:newsflutter/utils/utils.dart';

class ScreenArguments {
  final Articles articles;

  ScreenArguments(this.articles);
}

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final Articles _articles = args.articles;

    return Scaffold(
      appBar: AppBar(
        title: Text(_articles.source.name,
            style: TextStyle(
                color: ColorPalettes.red,
                fontSize: 18.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16),
                  child: Text(
                    _articles.title,
                    style: TextStyle(
                      color: ColorPalettes.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: CachedNetworkImage(
                    imageUrl: _articles.urlToImage == null
                        ? AppConstant.errorImage
                        : _articles.urlToImage,
                    imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                      color: ColorPalettes.grey,
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    )),
                    placeholder: (context, url) =>
                        Container(color: ColorPalettes.grey),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Text(
                    _articles.description,
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 16.0,
                      color: isDark
                          ? ColorPalettes.darkTextPrimary
                          : ColorPalettes.lightTextPrimary,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
                  child: Text(
                    AppConstant.dummyLongText,
                    style: TextStyle(
                      fontSize: 16.0,
                      height: 1.3,
                      color: isDark
                          ? ColorPalettes.darkTextPrimary
                          : ColorPalettes.lightTextPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 72.0,
          ),
        ],
      ),
    );
  }
}
