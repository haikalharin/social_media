import 'package:base_app_new/pages/firstPage/article_detail_page.dart';
import 'package:base_app_new/pages/firstPage/list_article_vertical.dart';
import 'package:base_app_new/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/remote_utils.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.firstPage:
        return MaterialPageRoute(
            builder: (_) => ListArticleVertical());
      case RouteName.firstPage:
        return MaterialPageRoute(
            builder: (_) => ArticleDetailPage());

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