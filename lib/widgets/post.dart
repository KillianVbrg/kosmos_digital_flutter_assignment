import 'package:assignment/constants/colors.dart';
import 'package:assignment/screens/feed/details.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({required this.user, required this.imagePath, super.key});

  final String user;
  final String imagePath;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(
                  user: "Killian",
                  imagePath: "assets/picture_placeholder_2.png",
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          showCupertinoModalPopup(context: context, builder: (context) {
                            return CupertinoActionSheet(
                              title: StyledBodySmall("Que souhaitez vous faire ?"),
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: (){},
                                  child: Text("Signalez cette publication", style: TextStyle(color: Colors.red),),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: (){},
                                  child: Text("Supprimer la publication", style: TextStyle(color: Colors.red),),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: CupertinoActionSheetAction(
                                    onPressed: (){},
                                    child: Text("Close", style: TextStyle(color: Colors.blue),),
                                    isDestructiveAction: true,
                                  ),
                                ),
                              ],
                            );
                          });
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.more_vert_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 125,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [AppColors.primaryColor.withOpacity(0.75), Colors.transparent], begin: Alignment.centerRight, end: Alignment.centerLeft)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/profile_placeholder_1.png"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    StyledTitleSmall("User's name"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    StyledBodySmall("22 min"),
                                  ],
                                ),
                                StyledBodySmall("Post description")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
