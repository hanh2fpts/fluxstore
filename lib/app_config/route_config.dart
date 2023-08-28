import 'package:flutter/cupertino.dart';
import 'package:fluxstore/presentation/sidebar/about_page.dart';
import 'package:fluxstore/presentation/intro/intro_page.dart';
import 'package:fluxstore/presentation/home/notification_page.dart';
import 'package:fluxstore/presentation/setting/setting_noti_page.dart';
import 'package:fluxstore/presentation/setting/setting_page.dart';
import 'package:fluxstore/presentation/sidebar/support_page.dart';

import 'presentation/discover/search_page.dart';
import 'presentation/home/home_page.dart';

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case IntroPage.routeName:
      return CupertinoPageRoute(builder: (context) => const IntroPage());
    case HomePage.routeName:
      return CupertinoPageRoute(builder: (context) => HomePage());
    case SearchPage.routeName:
      return CupertinoPageRoute(builder: (context) => const SearchPage());
    case NotificationPage.routeName:
      return CupertinoPageRoute(builder: (context) => const NotificationPage());
    case SettingPage.routeName:
      return CupertinoPageRoute(builder: (context) => const SettingPage());
    case SupportPage.routeName:
      return CupertinoPageRoute(builder: (context) => const SupportPage());
    case AboutPage.routeName:
      return CupertinoPageRoute(builder: (context) => const AboutPage());
    case SettingNotificationPage.routeName:
      return CupertinoPageRoute(builder: (context) => const SettingNotificationPage());
    default:
      return CupertinoPageRoute(builder: (context) => const HomePage());
  }
}
