import 'package:assignment/screens/auth/login.dart';
import 'package:assignment/screens/auth/register.dart';
import 'package:assignment/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:assignment/widgets/texts.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StyledHeadlineLargest(text: "Connectez-vous ou créez un compte.", centered: true,),
            Column(
              children: [
                StyledButton(
                  () => {Navigator.push(context, MaterialPageRoute(builder: (ctx) => Login() ))},
                  StyledTitleSmall("Connexion"),
                ),
                StyledButton(
                  () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    ),
                  },
                  StyledTitleSmall("Inscription"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
