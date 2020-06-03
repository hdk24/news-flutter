import 'package:flutter/material.dart';
import 'package:newsflutter/common/styles/styles.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container _placeholderBox([double h, double w = double.infinity]) {
      return Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          color: ColorPalettes.shimmerColor,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          shape: BoxShape.rectangle,
        ),
      );
    }

    final _shimmerGradient = LinearGradient(
      begin: Alignment(1,0.5),
      end: Alignment(-1,-0.25),
      stops: [0.45, 0.5, 0.55],
      colors: [ColorPalettes.shimmerColor, ColorPalettes.shimmerGradient, ColorPalettes.shimmerColor],
    );

    final _shimmerView = ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(height: 225, color: ColorPalettes.grey);
        } else {
          return Container(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _placeholderBox(14.0),
                      SizedBox(height: 8.0),
                      _placeholderBox(14.0),
                      SizedBox(height: 12.0),
                      _placeholderBox(14.0, 50.0),
                    ],
                  ),
                ),
                SizedBox(width: 12.0),
                Container(
                  width: 140,
                  height: 78.75,
                  decoration: BoxDecoration(
                    color: ColorPalettes.shimmerColor,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    shape: BoxShape.rectangle,
                  ),
                )
              ],
            ),
          );
        }
      },
    );

    return Container(
      child: Shimmer(
        gradient: _shimmerGradient,
        child: _shimmerView,
      ),
    );
  }
}
