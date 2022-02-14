import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Push Notification',
        ),
      ),
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

          if (snapshot.data.length > 0) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: const EdgeInsets.all(20),
                            color: Colors.amber[100],
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Text(snapshot.data[index].name),
                                  Text(snapshot.data[index].token)
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/notification');
                      },
                      child: const Text("go to local notification"),
                    ),
                  )
                ],
              ),
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
