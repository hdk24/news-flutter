import 'package:timeago/timeago.dart' as timeAgo;

class AppUtils{

  static String toTimeAgo(DateTime time) => timeAgo.format(time);

}