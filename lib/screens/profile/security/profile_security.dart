import 'package:assignment/screens/profile/security/profile_security_email.dart';
import 'package:assignment/screens/profile/security/profile_security_password.dart';
import 'package:assignment/widgets/profile_tile.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';

class ProfileSecurity extends StatelessWidget {
  const ProfileSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledHeadlineMedium("Sécurité"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            ProfileTile(
                text: "Adresse mail",
                subText: "email@gmail.com",
                suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                redirect: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSecurityEmail()));
                }
            ),
            ProfileTile(
                text: "Mot de passe",
                subText: "Dernière modification: il y a 3j",
                suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                redirect: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSecurityPassword()));
                }
            ),
          ],
        ),
      ),
    );
  }
}
