import 'package:flutter/cupertino.dart';
import 'package:fluxstore/presentation/intro_page.dart';
import 'package:fluxstore/presentation/notification_page.dart';

import 'presentation/discover/search_page.dart';
import 'presentation/home_page.dart';
import 'presentation/menu_page.dart';

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case IntroPage.routeName:
      return CupertinoPageRoute(builder: (context) => const IntroPage());
    case HomePage.routeName:
      return CupertinoPageRoute(builder: (context) => const HomePage());
    case SearchPage.routeName:
      return CupertinoPageRoute(builder: (context) => const SearchPage());
    case MenuPage.routeName:
      return CupertinoPageRoute(builder: (context) => const MenuPage());
    case NotificationPage.routeName:
      return CupertinoPageRoute(builder: (context) => const NotificationPage());
    default:
      return CupertinoPageRoute(builder: (context) => const HomePage());
  }
}
