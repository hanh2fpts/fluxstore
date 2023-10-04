import 'package:flutter/material.dart';
import 'package:fluxstore/app_config/text_style_config.dart';

import '../../model/notification_model.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static const String routeName = 'notification_page';
  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> listItem = [
      NotificationModel(
          title: 'Good morning! Get 20% Voucher',
          description: 'Summer sale up to 20% off. Limited voucher. Get now!! 😜'),
      NotificationModel(
          title: 'Special offer just for you', description: 'New Autumn Collection 30% off'),
      NotificationModel(title: 'Holiday sale 50%', description: 'Tap here to get 50% voucher.')
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification',
            style: TextStyleConfig.titleStyle,
          ),
        ),
        body: ListView.builder(
          itemCount: listItem.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = listItem[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        item.description,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
