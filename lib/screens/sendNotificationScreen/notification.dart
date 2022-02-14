import 'package:flutter/material.dart';
import 'package:psuhnotifcation/services/notification_service.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationService _notificationService = NotificationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NotificationScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () async {
                await _notificationService.showNotifications(
                    title: "miran", body: "say hello");
              },
              child: const Text('send notification now'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () async {
                await _notificationService.scheduleNotifications(
                    title: "miran", body: "say hello", second: 10);
              },
              child: const Text('send notification after 10 seocnd'),
            ),
          ],
        ),
      ),
    );
  }
}
