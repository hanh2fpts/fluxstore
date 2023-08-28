import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingNotificationPage extends StatefulWidget {
  const SettingNotificationPage({super.key});
  static const String routeName = 'setting_noti_page';

  @override
  State<SettingNotificationPage> createState() => _SettingNotificationPageState();
}

class _SettingNotificationPageState extends State<SettingNotificationPage> {
  bool enableNoti = true;
  bool enableNotiSound = true;
  bool enableLockScreenNoti = false;
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
                fontSize: 16,
              ),
            ),
            subtitle: const Text(
              'Receive push notifications for new messages',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            trailing: CupertinoSwitch(
                value: enableNoti,
                onChanged: (value) {
                  setState(() {
                    enableNoti = value;
                  });
                }),
          ),
          ListTile(
            title: const Text(
              'Notification sounds',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            subtitle: const Text(
              'Play sound for new messages',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            trailing: CupertinoSwitch(
                value: enableNotiSound,
                onChanged: (value) {
                  setState(() {
                    enableNotiSound = value;
                  });
                }),
          ),
          ListTile(
            title: const Text(
              'Lock screen notifications',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            subtitle: const Text(
              'Allow notification on the lock screen',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            trailing: CupertinoSwitch(value: enableLockScreenNoti, onChanged: (value) {
              setState(() {
                enableLockScreenNoti = value;
              });
            }),
          ),
        ],
      ),
    );
  }
}
