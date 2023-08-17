import 'package:flutter/cupertino.dart';
import 'package:fluxstore/presentation/intro_page.dart';

import 'presentation/home_page.dart';

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case IntroPage.routeName:
      return CupertinoPageRoute(builder: (context) => const IntroPage());
    case HomePage.routeName:
      return CupertinoPageRoute(builder: (context) => const HomePage());
    // case '/home':
    //   return MaterialPageRoute(builder: (context) => HomePage());
    // case '/profile':
    //   return MaterialPageRoute(builder: (context) => ProfilePage());
    default:
      return CupertinoPageRoute(builder: (context) => const HomePage());
  }
}
