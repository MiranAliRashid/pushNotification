import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:psuhnotifcation/providers/auth_providr.dart';
import 'package:psuhnotifcation/screens/startScreen/start_screen.dart';
import 'package:psuhnotifcation/screens/tokenScreen/teken_screen.dart';

class AuthHandlerScreen extends StatelessWidget {
  const AuthHandlerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<AuthProvider>(context, listen: true).isLoggedIn(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.data == true) {
            //user is logged in so redirect to home
            return TokenScreen();
            //return const StartScreen();
          }
          //user is not logged in so redirect to login
          return const StartScreen();
        },
      ),
    );
  }
}
