import 'package:flutter/material.dart';
import 'package:fluxstore/app_config/app_config.dart';
import 'package:fluxstore/presentation/sidebar/about_page.dart';
import 'package:fluxstore/presentation/home/home_page.dart';
import 'package:fluxstore/presentation/setting/setting_page.dart';
import 'package:fluxstore/presentation/sidebar/support_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with AutomaticKeepAliveClientMixin<MenuPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NavigationDrawer(
      onDestinationSelected: (value) {
        switch (value) {
          case 0:
            AppConfig.currentIndex = 0;
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          case 1:
            AppConfig.currentIndex = 1;
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          case 2:
            AppConfig.currentIndex = 2;
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          case 3:
            AppConfig.currentIndex = 3;
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          case 4:
            AppConfig.currentIndex = 4;
            Navigator.of(context).pushReplacementNamed(SettingPage.routeName);
          case 5:
            AppConfig.currentIndex = 5;
            Navigator.of(context).pushReplacementNamed(SupportPage.routeName);
          case 6:
            AppConfig.currentIndex = 6;
            Navigator.of(context).pushReplacementNamed(AboutPage.routeName);
        }
      },
      selectedIndex: AppConfig.currentIndex,
      children: const [
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Spacer(),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                radius: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sunie Pham',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'sunieux@gmail.com',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Spacer(),
            ],
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.home_filled),
          label: Text(
            'Homepage',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.search),
          label: Text(
            'Discover',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.badge),
          label: Text(
            'My Order',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.person),
          label: Text(
            'My Profile',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'OTHER',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text(
            'Setting',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.email_outlined),
          label: Text(
            'Support',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.info_outline),
          label: Text(
            'About us',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
