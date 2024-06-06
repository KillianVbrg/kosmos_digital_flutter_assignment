import 'package:assignment/services/firestore/post_store.dart';
import 'package:assignment/services/firestore/user_info_store.dart';
import 'package:assignment/theme.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:assignment/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp (ChangeNotifierProvider(
    create: (context) => PostStore(),
    child: ChangeNotifierProvider(
      create: (context) => UserInfoStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My assignment",
        theme: primaryTheme,
        home: const Scaffold(
          body: SafeArea(
            child: Wrapper(),
          ),
        ),
      ),
    ),
  ));
}