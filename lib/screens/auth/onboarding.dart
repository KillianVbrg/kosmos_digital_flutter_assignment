import 'dart:io';

import 'package:assignment/constants/colors.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
              SizedBox(
                height: 30,
              ),
              StyledHeadlineLargest(text: "Créez votre profil", centered: true),
              SizedBox(
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
                  SizedBox(
                    height: 15,
                  ),
                  StyledTextField(
                    label: "Prénom*",
                    hint: "Ex. John",
                    isHidden: false,
                    controller: firstNameController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  StyledBodyMedium(text: "Photo de profil*", centered: true,),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

                      if(returnedImage == null) return;
                      setState(() {
                        selectedImage = File(returnedImage!.path);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 3),
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
                            StyledHeadlineSmall(text: "Appuyez pour choisir une photo", centered: true)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  StyledButton(
                    () => {},
                    StyledTitleSmall("Terminer l'inscription"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StyledBodyMedium(text: "*Les champs marqués sont obligatoires", centered: true,),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
