import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/presentation/menu_page.dart';
import 'package:fluxstore/presentation/notification_page.dart';

import 'setting/setting_noti_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  static const routeName = 'setting_page';
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        drawer: const MenuPage(),
        appBar: AppBar(
          title: const Text(
            'Setting',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: SvgPicture.asset('assets/icons/icon_menu.svg'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SettingItemWidget(
                title: 'Language',
                imagePath: 'assets/icons/Lang.svg',
                selectFunction: () {
                  debugPrint('Language');
                },
              ),
              SettingItemWidget(
                title: 'Notification',
                imagePath: 'assets/icons/Bell_duotone.svg',
                selectFunction: () => Navigator.of(context).pushNamed(SettingNotificationPage.routeName),
              ),
              SettingItemWidget(
                title: 'Terms of Use',
                imagePath: 'assets/icons/term.svg',
                selectFunction: () {},
              ),
              SettingItemWidget(
                title: 'Pricavy Policy',
                imagePath: 'assets/icons/Line.svg',
                selectFunction: () {},
              ),
              SettingItemWidget(
                title: 'Chat support',
                imagePath: 'assets/icons/chat.svg',
                selectFunction: () {},
              ),
              SettingItemWidget(
                title: 'Color Theme',
                imagePath: 'assets/icons/moon.svg',
                selectFunction: () {},
              ),
            ],
          ),
        ));
  }
}

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.selectFunction,
  });
  final String title;
  final String imagePath;
  final Function() selectFunction;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: selectFunction,
          title: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF33302E),
              fontSize: 16,
            ),
          ),
          leading: SvgPicture.asset(imagePath),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
        const Divider(
          color: Color(0xFFF3F3F6),
        )
      ],
    );
  }
}
