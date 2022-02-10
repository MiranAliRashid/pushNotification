import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psuhnotifcation/providers/auth_providr.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: TextButton(
            child: Text('Sign in anonymously'),
            onPressed: () async {
              await Provider.of<AuthProvider>(context, listen: false)
                  .signInAnonymously();
            },
          ),
        ),
      ),
    );
  }
}
