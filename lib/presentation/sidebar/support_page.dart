import 'package:flutter/material.dart';
import 'package:fluxstore/presentation/menu/menu_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});
  static const String routeName = 'support_page';

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> _launchZalo() async {
    if (!await launchUrl(Uri.parse('https://zalo.me/0327995213'))) {
      throw Exception('Could not launch');
    }
  }

  Future<void> _launchMessenger() async {
    const url = 'http://m.me/hunghakma';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      const webUrl = 'https://www.facebook.com/messages/t/hunghakma';
      if (await canLaunchUrl(Uri.parse(webUrl))) {
        await launchUrl(Uri.parse(webUrl));
      } else {
        throw 'Could not launch $url';
      }
    }
  }

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
      body: Align(
        alignment: Alignment.topCenter,
        child: Wrap(
          spacing: 20,
          children: [
            GestureDetector(
              onTap: () => _launchZalo(),
              child: const ContainerWidget(title: 'Zalo'),
            ),
            GestureDetector(
              onTap: () => _launchMessenger(),
              child: const ContainerWidget(title: 'Messenger'),
            ),
            GestureDetector(
              onTap: () async {
                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'fpts@gmail.com',
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'Example Subject & Symbols are allowed!',
                  }),
                );
                if (!await launchUrl(emailLaunchUri)) {
                  throw Exception('loi mail');
                }
              },
              child: const ContainerWidget(title: 'Mail'),
            ),
            GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse('tel:+84327995213'))) {
                    throw Exception('loi click goi dien');
                  }
                },
                child: const ContainerWidget(title: 'Phone')),
          ],
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
