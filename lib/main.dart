import 'package:assignment/screens/feed/feed.dart';
import 'package:assignment/screens/landing.dart';
import 'package:assignment/services/firestore/post_store.dart';
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
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My assignment",
      theme: primaryTheme,
      home: Scaffold(
        body: SafeArea(
          child: Wrapper(),
        ),
      ),
    ),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),

        color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledBodySmall("Small body"),
            StyledBodyMedium(text: "Medium body", centered: true,),
            StyledHeadlineSmall(text: "Small headline", centered: true,),
            StyledHeadlineMedium("Medium headline"),
            StyledHeadlineLarge(text: "Large headline", centered: true,),
            StyledTitleSmall("Small title"),
            StyledTitleMedium("Medium title"),
            StyledTitleLarge("Large title"),
            StyledButton(
                  () {},
              StyledTitleSmall("Test"),
            ),
          ],
        ),
      ),
    );
  }
}
