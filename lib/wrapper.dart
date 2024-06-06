import 'package:assignment/screens/feed/feed.dart';
import 'package:assignment/screens/landing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    print(firebaseUser);

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          if(firebaseUser == null){
              return const Landing();
            } else {
              return const Feed();
            }
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
