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
          decoration: BoxDecoration(
            color: ColorPalettes.grey,
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(poster),
              fit: BoxFit.cover,
              colorFilter: ColorPalettes.grayscaleFilter,
            ),
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
              Text(source,
                style: TextStyle(
                  color: ColorPalettes.red,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}