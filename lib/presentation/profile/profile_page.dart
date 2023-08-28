import 'package:flutter/material.dart';
import 'package:fluxstore/presentation/profile/profile_setting_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
          const Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Address'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.place),
                ),
                Divider(),
                ListTile(
                  title: Text('Payment method'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.payment),
                ),
                Divider(),
                ListTile(
                  title: Text('Voucher'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.card_giftcard),
                ),
                Divider(),
                ListTile(
                  title: Text('My Wishlist'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.favorite),
                ),
                Divider(),
                ListTile(
                  title: Text('Rate this app'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.star),
                ),
                Divider(),
                ListTile(
                  title: Text('Log out'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.logout),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
