import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/styles/styles.dart';
import 'package:newsflutter/data/data.dart';
import 'package:newsflutter/ui/main.dart';
import 'package:newsflutter/utils/utils.dart';

class NewsItem extends StatelessWidget {
  final Articles articles;
  final Function onTap;

  const NewsItem({Key key, this.articles, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _placeHolder = Container(
      decoration: new BoxDecoration(
        color: ColorPalettes.grey,
        borderRadius: new BorderRadius.all(Radius.circular(8)),
      ),
    );

    return Container(
      padding: EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articles.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: isDark
                            ? ColorPalettes.darkTextPrimary
                            : ColorPalettes.lightTextPrimary,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    articles.source.name + "  •  " +
                        AppUtils.toTimeAgo(articles.publishedAt),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: isDark
                          ? ColorPalettes.darkTextSecondary
                          : ColorPalettes.lightTextSecondary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Container(
              width: 140,
              height: 78.75,
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage == null
                    ? AppConstant.errorImage
                    : articles.urlToImage,
                imageBuilder: (context, imageProvider) =>
                    Container(
                        decoration: BoxDecoration(
                          color: ColorPalettes.grey,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                placeholder: (context, url) => _placeHolder,
                errorWidget: (context, url, error) => _placeHolder,
              ),
            )
          ],
        ),
      ),
    );
  }
}
