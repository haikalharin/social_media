import 'package:social_media/pages/consultation_page/list_post_page.dart';
import 'package:social_media/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/user_page/list_user_vertical.dart';
import '../pages/second_page/user_detail_page.dart';
import '../utils/remote_utils.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.firstPage:
        return MaterialPageRoute(
            builder: (_) => ListUserVertical());
      case RouteName.secondPage:
        return MaterialPageRoute(
            builder: (_) => ArticleDetailPage(data: getPeopleDetail(settings.arguments)));
      case RouteName.listPost:
        return MaterialPageRoute(
            builder: (_) => ListPostPage(isFromUser: getIsFromUser(settings.arguments)));

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ),
        );
    }
  }

  static Map<String, WidgetBuilder> _getCombinedRoutes() => {};

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}