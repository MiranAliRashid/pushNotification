import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psuhnotifcation/models/user_model.dart';
import 'package:psuhnotifcation/providers/auth_providr.dart';

class TokenScreen extends StatefulWidget {
  TokenScreen({Key? key}) : super(key: key);

  @override
  State<TokenScreen> createState() => _TokenScreenState();
}

class _TokenScreenState extends State<TokenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<AuthProvider>(context).getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          }
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('No data'),
            );
          }
          if (snapshot.data.length > 0) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: const EdgeInsets.all(20),
                    color: Colors.amber[100],
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(snapshot.data[index].name),
                    ));
              },
            );
          } else {
            return Center(
              child: Text('No data'),
            );
          }
        },
      ),
    );
  }
}
