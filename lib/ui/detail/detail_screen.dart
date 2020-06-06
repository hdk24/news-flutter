import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/common.dart';
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
  var _isBookmark = false;

  List<MenuItem> _menuItemDetail = [
    MenuItem(id: 1, title: 'Open Link', icon: Icons.link),
    MenuItem(id: 2, title: 'Share', icon: Icons.share),
  ];

  void setBookmark(bool isBookmark) {
    setState(() {
      _isBookmark = isBookmark;
    });
  }

  void _onMenuItemSelected(int itemId, Articles _articles) {
    if (itemId == 1) {
      AppUtils.launchUrl(_articles.url);
    } else if (itemId == 2) {
      AppUtils.shareNews(
          _articles.title, _articles.source.name, _articles.url);
    }
  }


  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute
        .of(context)
        .settings
        .arguments;
    final Articles _articles = args.articles;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(_articles.source.name,
            style: TextStyle(
                color: ColorPalettes.red,
                fontSize: 18.0,
                fontWeight: FontWeight.bold)),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (BuildContext context) {
              return _menuItemDetail.map((MenuItem item) {
                return PopupMenuItem(
                  value: item.id,
                  child: Text(item.title),
                );
              }).toList();
            },
            onSelected: (value) => _onMenuItemSelected(value, _articles),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      _articles.title,
                      style: TextStyle(
                        color: isDark
                            ? ColorPalettes.darkTextPrimary
                            : ColorPalettes.lightTextPrimary,
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
                      imageBuilder: (context, imageProvider) =>
                          Container(
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
              margin: EdgeInsets.only(
                  left: 16.0, top: 12.0, bottom: 12.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      child: Container(
                          margin: EdgeInsets.only(right: 8.0),
                          padding: EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.mode_edit,
                                    size: 16.0, color: Colors.grey[600]),
                              ),
                              Text(
                                "Write your comment here",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: ColorPalettes.grey,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),

                  // Button send message
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                      color: Colors.grey,
                      icon: Icon(Icons.message),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                      color:
                      _isBookmark ? ColorPalettes.red : ColorPalettes.grey,
                      icon: Icon(Icons.bookmark),
                      onPressed: () {
                        _isBookmark = !_isBookmark;
                        setBookmark(_isBookmark);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
