import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/app_config/app_config.dart';
import 'package:fluxstore/presentation/discover/discover_page.dart';
import 'package:fluxstore/presentation/menu_page.dart';
import 'package:fluxstore/presentation/notification_page.dart';
import 'package:fluxstore/presentation/order_page.dart';
import 'package:fluxstore/presentation/overview_page.dart';
import 'package:fluxstore/presentation/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// danh sach page
  final List<Widget> pages = [
    const OverviewPage(),
    const DiscoverPage(),
    const OrderPage(),
    const ProfilePage(),
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String setTitlePage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return 'Fluxstore';
      case 1:
        return 'Discover';
      case 2:
        return 'Order';
      case 3:
        return '';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const MenuPage(),
        appBar: AppBar(
          title: Text(
            setTitlePage(AppConfig.currentIndex),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: SvgPicture.asset('assets/icons/icon_menu.svg'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed(NotificationPage.routeName),
                icon: SvgPicture.asset('assets/icons/icon_bell.svg'),
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: AppConfig.currentIndex,
          children: pages,
        ),
        bottomNavigationBar: NavigationBar(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          indicatorColor: Colors.white,
          backgroundColor: Colors.white,
          animationDuration: const Duration(milliseconds: 0),
          onDestinationSelected: (value) {
            setState(() {
              AppConfig.currentIndex = value;
            });
          },
          selectedIndex: AppConfig.currentIndex,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/icon_home.svg'),
              label: '',
              tooltip: 'Home',
              selectedIcon: SvgPicture.asset('assets/icons/icon_home_select.svg'),
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/icon_search.svg'),
              label: '',
              tooltip: 'Search',
              selectedIcon: SvgPicture.asset('assets/icons/icon_search_select.svg'),
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/icon_order.svg'),
              label: '',
              tooltip: 'Order',
              selectedIcon: SvgPicture.asset('assets/icons/icon_order_select.svg'),
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/icon_profile.svg'),
              label: '',
              tooltip: 'Profile',
              selectedIcon: SvgPicture.asset('assets/icons/icon_profile_select.svg'),
            ),
          ],
        ));
  }
}
