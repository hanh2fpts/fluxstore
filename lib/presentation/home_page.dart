import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/cubit/home_cubit.dart';
import 'package:fluxstore/presentation/discover_page.dart';
import 'package:fluxstore/presentation/order_page.dart';
import 'package:fluxstore/presentation/overview_page.dart';
import 'package:fluxstore/presentation/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = 'home_page';
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const OverviewPage(),
      const DiscoverPage(),
      const OrderPage(),
      const ProfilePage()
    ];
    return Scaffold(body: BlocBuilder<HomeCubit, int>(
      builder: (context, state) {
        return IndexedStack(
          index: state,
          children: pages,
        );
      },
    ), bottomNavigationBar: BlocBuilder<HomeCubit, int>(
      builder: (context, state) {
        return NavigationBar(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          indicatorColor: Colors.white,
          backgroundColor: Colors.white,
          animationDuration: const Duration(milliseconds: 0),
          onDestinationSelected: (value) => context.read<HomeCubit>().selectIndex(value),
          selectedIndex: state,
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
        );
      },
    ));
  }
}
