import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';

class ProfileInfoDetails extends StatefulWidget {
  const ProfileInfoDetails({super.key});

  @override
  State<ProfileInfoDetails> createState() => _ProfileInfoDetailsState();
}

class _ProfileInfoDetailsState extends State<ProfileInfoDetails> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeadlineMedium("Infos personnelles"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            StyledTextField(
              label: "Prénom*",
              hint: "John",
              isHidden: false,
              controller: firstName,
            ),
            SizedBox(
              height: 15,
            ),
            StyledTextField(
              label: "Nom*",
              hint: "Doe",
              isHidden: false,
              controller: lastName,
            ),
            SizedBox(
              height: 20,
            ),
            StyledButton(
              () => {},
              StyledTitleSmall("Enregistrer") ,
            ),
            SizedBox(
              height: 10,
            ),
            StyledBodyMedium(text: "*Les champs marqués sont obligatoires", centered: true,),
          ],
        ),
      ),
    );
  }
}
