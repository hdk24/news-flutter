import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/styles/styles.dart';

class TopNews extends StatelessWidget {
  final String poster;
  final String title;
  final String source;
  final Function onTap;

  const TopNews({Key key, this.poster, this.title, this.source, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 225,
          child: CachedNetworkImage(
            imageUrl: poster,
            imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  color: ColorPalettes.grey,
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: ColorPalettes.grayscaleFilter,
                  ),
                )
            ),
            placeholder: (context, url) => Container(color: ColorPalettes.grey),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Container(
          height: 225,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle, color: Colors.black.withOpacity(0.5)),
        ),
        Positioned(
          bottom: 24.0,
          left: 16.0,
          right: 16.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ColorPalettes.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorPalettes.red)
                ),
                child: Text(source,
                  style: TextStyle(
                    color: ColorPalettes.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}
