import 'package:assignment/screens/home/feed.dart';
import 'package:assignment/screens/landing.dart';
import 'package:assignment/theme.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp (MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "My assignment",
    theme: primaryTheme,
    home: Scaffold(
      body: SafeArea(
        child: Landing(),
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
