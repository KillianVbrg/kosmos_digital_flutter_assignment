import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';

class PostDescriptionInput extends StatefulWidget {
  const PostDescriptionInput({super.key});

  @override
  State<PostDescriptionInput> createState() => _PostDescriptionInputState();
}

class _PostDescriptionInputState extends State<PostDescriptionInput> {
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
            StyledButton(
                  () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostDescriptionInput()))
              },
              StyledTitleSmall("Publier"),
            ),
          ],
        ),
      ),
    );
  }
}
