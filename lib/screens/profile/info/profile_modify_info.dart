import 'package:assignment/screens/profile/info/profile_info_details.dart';
import 'package:assignment/widgets/profile_tile.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';

class ProfileModifyInfo extends StatelessWidget {
  const ProfileModifyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeadlineMedium("Modifier"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ProfileTile(
          text: "Informations personnelles",
          subText: "Nom, prénom, date de naissance, ...",
          suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
          redirect: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInfoDetails()));
        }),
      ),
    );
  }
}
