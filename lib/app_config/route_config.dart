import 'package:flutter/cupertino.dart';
import 'package:fluxstore/presentation/account/create_new_password_page.dart';
import 'package:fluxstore/presentation/account/forgot_password_page.dart';
import 'package:fluxstore/presentation/account/log_in_page.dart';
import 'package:fluxstore/presentation/account/sign_up_page.dart';
import 'package:fluxstore/presentation/account/verification_code_page.dart';
import 'package:fluxstore/presentation/profile/address_page.dart';
import 'package:fluxstore/presentation/profile/payment_page.dart';
import 'package:fluxstore/presentation/profile/profile_setting_page.dart';
import 'package:fluxstore/presentation/profile/rate_app_page.dart';
import 'package:fluxstore/presentation/profile/wishlist_page.dart';
import 'package:fluxstore/presentation/sidebar/about_page.dart';
import 'package:fluxstore/presentation/intro/intro_page.dart';
import 'package:fluxstore/presentation/home/notification_page.dart';
import 'package:fluxstore/presentation/setting/setting_noti_page.dart';
import 'package:fluxstore/presentation/setting/setting_page.dart';
import 'package:fluxstore/presentation/sidebar/support_page.dart';

import '../presentation/discover/search_page.dart';
import '../presentation/home/home_page.dart';

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case IntroPage.routeName:
      return CupertinoPageRoute(builder: (context) => const IntroPage());
    case HomePage.routeName:
      return CupertinoPageRoute(builder: (context) => const HomePage());
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
    case ProfileSettingPage.routeName:
      return CupertinoPageRoute(builder: (context) => const ProfileSettingPage());
    case SignUpPage.routeName:
      return CupertinoPageRoute(builder: (context) => const SignUpPage());
    case LoginPage.routeName:
      return CupertinoPageRoute(builder: (context) => const LoginPage());
    case ForgotPasswordPage.routeName:
      return CupertinoPageRoute(builder: (context) => const ForgotPasswordPage());
    case VerificationCodePage.routeName:
      return CupertinoPageRoute(builder: (context) => const VerificationCodePage());
    case CreateNewPasswordPage.routeName:
      return CupertinoPageRoute(builder: (context) => const CreateNewPasswordPage());
    case AddressPage.routeName:
      return CupertinoPageRoute(builder: (context) => const AddressPage());
    case RateAppPage.routeName:
      return CupertinoPageRoute(builder: (context) => const RateAppPage());
    case WishlistPage.routeName:
      return CupertinoPageRoute(builder: (context) => const WishlistPage());
      case PaymentMethodPage.routeName:
      return CupertinoPageRoute(builder: (context) => const PaymentMethodPage());
    default:
      return CupertinoPageRoute(builder: (context) => const HomePage());
  }
}
