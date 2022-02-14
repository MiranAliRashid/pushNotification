import 'package:flutter/material.dart';
import 'package:psuhnotifcation/screens/sendNotificationScreen/notification.dart';
import 'package:psuhnotifcation/services/auth_handler.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const AuthHandlerScreen(),
      '/notification': (context) => NotificationScreen(),
    });
  }
}
