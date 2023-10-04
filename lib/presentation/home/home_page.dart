import 'package:flutter/material.dart';
import 'package:fluxstore/app_config/app_config.dart';
import 'package:fluxstore/app_config/text_style_config.dart';
import 'package:fluxstore/presentation/discover/discover_page.dart';
import 'package:fluxstore/presentation/menu/menu_page.dart';
import 'package:fluxstore/presentation/home/notification_page.dart';
import 'package:fluxstore/presentation/order/order_page.dart';
import 'package:fluxstore/presentation/overview/overview_page.dart';
import 'package:fluxstore/presentation/profile/profile_page.dart';

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

  /// set title page
  String setTitlePage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return 'Fluxstore';
      case 1:
        return 'Discover';
      case 2:
        return 'Order';
      case 3:
        return 'Profile';
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
            style: TextStyleConfig.titleStyle,
          ),
          leading: IconButton(
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(Icons.menu),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed(NotificationPage.routeName),
                icon: const Icon(Icons.notifications_active),
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: AppConfig.currentIndex,
          children: pages,
        ),
        bottomNavigationBar: NavigationBar(
          height: 60,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          animationDuration: const Duration(milliseconds: 5),
          onDestinationSelected: (value) {
            setState(() {
              AppConfig.currentIndex = value;
            });
          },
          selectedIndex: AppConfig.currentIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: '',
              tooltip: 'Home',
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              label: '',
              tooltip: 'Search',
              selectedIcon: Icon(Icons.search),
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_bag_outlined),
              label: '',
              tooltip: 'Order',
              selectedIcon: Icon(Icons.shopping_bag),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: '',
              tooltip: 'Profile',
              selectedIcon: Icon(Icons.person),
            ),
          ],
        ));
  }
}
