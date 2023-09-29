import 'package:flutter/material.dart';
import 'package:fluxstore/presentation/account/log_in_page.dart';
import 'package:fluxstore/presentation/profile/profile_setting_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                  radius: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
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
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => Navigator.of(context).pushNamed(ProfileSettingPage.routeName),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    title: const Text('Address'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: const Icon(Icons.place),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {},
                    title: const Text('Payment method'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: const Icon(Icons.payment),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {},
                    title: const Text('Voucher'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: const Icon(Icons.card_giftcard),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {},
                    title: const Text('My Wishlist'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: const Icon(Icons.favorite),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {},
                    title: const Text('Rate this app'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: const Icon(Icons.star),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false),
                    title: const Text('Log out'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: const Icon(Icons.logout),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
