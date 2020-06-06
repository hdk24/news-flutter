import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:url_launcher/url_launcher.dart';

class AppUtils{

  static String toTimeAgo(DateTime time) => timeAgo.format(time);

  static Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> shareNews(String title, String source, String url) async {
    await FlutterShare.share(
        title: source,
        text: "See detail news with open this link : ",
        linkUrl: url,
        chooserTitle: 'Share using');
  }

  static Future<void> launchEmail(String email) async {
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Could not launch $email';
    }
  }

  static void showMessage(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}