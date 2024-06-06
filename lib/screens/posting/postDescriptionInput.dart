import 'dart:io';

import 'package:assignment/models/post.dart';
import 'package:assignment/screens/feed/feed.dart';
import 'package:assignment/services/firestore/post_store.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class PostDescriptionInput extends StatefulWidget {
  const PostDescriptionInput({required this.selectedImage, super.key});

  final File selectedImage;

  @override
  State<PostDescriptionInput> createState() => _PostDescriptionInputState();
}

class _PostDescriptionInputState extends State<PostDescriptionInput> {
  final TextEditingController descriptionController = TextEditingController();
  String imageUrl = "";

  handleSubmit() async {
    // Reference to storage root > dir > file
    final Reference reference = FirebaseStorage.instance.ref().child("posts_images/${uuid.v4()}");
    // Store the file
    try{
      await reference.putFile(File(widget.selectedImage.path));

      imageUrl = await reference.getDownloadURL();
    } catch(error){
      print(error);
    }


    Provider.of<PostStore>(context, listen: false).addPost(Post(
        id: uuid.v4(),
        image: imageUrl,
        description: descriptionController.text.trim(),
        date: DateTime.now(),
        authorId: "12345uid"),
    );

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Feed(previousRoute: "posting",)), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledHeadlineLarge(text: "Ajoutez une description", centered: false),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ]
                ),
                child: TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 24,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintText: "Décrivez votre post",
                    hintStyle: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: descriptionController,
              builder: (context, value, widget) {

                return StyledButton(
                  descriptionController.text.trim().length == 0? null : handleSubmit,
                  StyledTitleSmall("Publier"),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
