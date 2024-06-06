import 'package:assignment/screens/feed/feed.dart';
import 'package:assignment/screens/landing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasError){
          print(snapshot.error.toString());
        }
        if(snapshot.connectionState == ConnectionState.active){
          if(snapshot.data == null){
            return Landing();
          } else {
            return Feed();
          }
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
