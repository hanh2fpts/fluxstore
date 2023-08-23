import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});
  static const String routeName = 'menu_page';
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (value) {},
      selectedIndex: 0,
      children: [
        const SizedBox(
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
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'sunieux@gmail.com',
                    style: TextStyle(
                      color: Colors.black,
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
          icon: SvgPicture.asset('assets/icons/icon_home_select.svg'),
          label: const Text(
            'Homepage',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          label: const Text(
            'Discover',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: SvgPicture.asset('assets/icons/shop_cart.svg'),
          label: const Text(
            'My Order',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: SvgPicture.asset('assets/icons/User_fill.svg'),
          label: const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'OTHER',
            style: TextStyle(
              color: Color(0xFF777E90),
              fontSize: 14,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: SvgPicture.asset('assets/icons/Setting_line.svg'),
          label: const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: SvgPicture.asset('assets/icons/Message_light.svg'),
          label: const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: SvgPicture.asset('assets/icons/Line.svg'),
          label: const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
