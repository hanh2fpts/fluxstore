import 'package:flutter/material.dart';
import 'package:fluxstore/presentation/menu/menu_page.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});
  static const String routeName = 'support_page';
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const MenuPage(),
      appBar: AppBar(
        title: const Text(
          'Support',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(Icons.menu),
        ),
      ),

      body: Container(),
    );
  }
}
