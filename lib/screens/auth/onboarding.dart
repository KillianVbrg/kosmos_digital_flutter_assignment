import 'dart:io';

import 'package:assignment/constants/colors.dart';
import 'package:assignment/models/user_info.dart' as UserInfoModel; // sinon collision avec UserInfo the Firebase Auth
import 'package:assignment/screens/feed/feed.dart';
import 'package:assignment/services/firestore/user_info_store.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  File? selectedImage;

  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const StyledHeadlineLargest(text: "Créez votre profil", centered: true),
              const SizedBox(
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledTextField(
                    label: "Nom*",
                    hint: "Ex. Doe",
                    isHidden: false,
                    controller: lastNameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  StyledTextField(
                    label: "Prénom*",
                    hint: "Ex. John",
                    isHidden: false,
                    controller: firstNameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const StyledBodyMedium(text: "Photo de profil*", centered: true,),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

                      if(returnedImage == null) return;
                      setState(() {
                        selectedImage = File(returnedImage.path);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      height: 125,
                      child: selectedImage != null ? Image.file(selectedImage!) : Container(
                        height: 125,
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload, color: AppColors.textMuted,),
                            const StyledHeadlineSmall(text: "Appuyez pour choisir une photo", centered: true)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  StyledButton(
                    () async {
                      // store the image
                      var imageUrl;
                      final Reference reference = FirebaseStorage.instance.ref().child("posts_images/${uuid.v4()}");
                      try{
                        await reference.putFile(File(selectedImage!.path));

                        imageUrl = await reference.getDownloadURL();
                      } catch(error){
                        print(error);
                      }


                      final userId = await FirebaseAuth.instance.currentUser!.uid;
                      final userInfoId = Provider.of<UserInfoStore>(context, listen: false).userInfo[0].id;
                      Provider.of<UserInfoStore>(context, listen: false).updateUserInfo(UserInfoModel.UserInfo(
                          id: userInfoId,
                          userId: userId,
                          firstName: firstNameController.text.trim(),
                          lastName: lastNameController.text.trim(),
                          image: imageUrl,
                          datePasswordUpdate: Provider.of<UserInfoStore>(context, listen: false).userInfo[0].datePasswordUpdate,
                          notification: Provider.of<UserInfoStore>(context, listen: false).userInfo[0].notification
                      ));

                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Feed()), (route) => false);
                    },
                    const StyledTitleSmall("Terminer l'inscription"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const StyledBodyMedium(text: "*Les champs marqués sont obligatoires", centered: true,),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
