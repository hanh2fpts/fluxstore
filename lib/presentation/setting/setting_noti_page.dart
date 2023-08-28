import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingNotificationPage extends StatelessWidget {
  const SettingNotificationPage({super.key});
  static const String routeName = 'setting_noti_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text(
              'Show notifications',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            subtitle: const Text(
              'Receive push notifications for new messages',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            trailing: CupertinoSwitch(value: true, onChanged: (value) {}),
          )
        ],
      ),
    );
  }
}
