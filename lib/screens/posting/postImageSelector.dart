import 'dart:io';

import 'package:assignment/constants/colors.dart';
import 'package:assignment/screens/posting/postDescriptionInput.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostImageSelector extends StatefulWidget {
  const PostImageSelector({super.key});

  @override
  State<PostImageSelector> createState() => _PostImageSelectorState();
}

class _PostImageSelectorState extends State<PostImageSelector> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
        child: Column(
          children: [
            const StyledHeadlineLarge(text: "Choisissez une image", centered: false),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Stack(
                children: [
                  DottedBorder(
                    strokeWidth: 1,
                    dashPattern: const [5,5],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(15),
                    child: selectedImage != null ?
                    SizedBox(
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          selectedImage!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ) :

                    GestureDetector(
                      onTap: () async {
                        final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

                        if(returnedImage == null) return;
                        setState(() {
                          selectedImage = File(returnedImage.path);
                        });
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
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
                  if(selectedImage != null)
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedImage = null;
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.delete_forever_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StyledButton(
              selectedImage == null ? null : () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostDescriptionInput(selectedImage: selectedImage!,)))
              },
              const StyledTitleSmall("Suivant"),
            ),
          ],
        ),
      ),
    );
  }
}
