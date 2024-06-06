import 'package:assignment/screens/feed/feed.dart';
import 'package:assignment/services/firestore/user_info_store.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/models/user_info.dart' as UserInfoModel;
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileInfoDetails extends StatefulWidget {
  const ProfileInfoDetails({super.key});

  @override
  State<ProfileInfoDetails> createState() => _ProfileInfoDetailsState();
}

class _ProfileInfoDetailsState extends State<ProfileInfoDetails> {
  @override
  Widget build(BuildContext context) {
    var userInfoProvider = Provider.of<UserInfoStore>(context, listen: false).userInfo[0];
    final TextEditingController firstNameController = TextEditingController(text: userInfoProvider.firstName);
    final TextEditingController lastNameController = TextEditingController(text: userInfoProvider.lastName);

    return Scaffold(
      appBar: AppBar(
        title: const StyledHeadlineMedium("Infos personnelles"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            StyledTextField(
              label: "Prénom*",
              hint: "John",
              isHidden: false,
              controller: firstNameController,
            ),
            const SizedBox(
              height: 15,
            ),
            StyledTextField(
              label: "Nom*",
              hint: "Doe",
              isHidden: false,
              controller: lastNameController,
            ),
            const SizedBox(
              height: 20,
            ),
            StyledButton(
              () {
                if(firstNameController.text.trim().length > 1 && lastNameController.text.trim().length > 1){
                  Provider.of<UserInfoStore>(context, listen: false).updateUserInfo(UserInfoModel.UserInfo(id: userInfoProvider.id, userId: FirebaseAuth.instance.currentUser!.uid, firstName: firstNameController.text.trim(), lastName: lastNameController.text.trim(), datePasswordUpdate: userInfoProvider.datePasswordUpdate, image: userInfoProvider.image, notification: userInfoProvider.notification));

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Feed()), (route) => false);
                }
              },
              const StyledTitleSmall("Enregistrer") ,
            ),
            const SizedBox(
              height: 10,
            ),
            const StyledBodyMedium(text: "*Les champs marqués sont obligatoires", centered: true,),
          ],
        ),
      ),
    );
  }
}
