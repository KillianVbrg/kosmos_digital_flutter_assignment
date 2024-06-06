import 'package:assignment/constants/colors.dart';
import 'package:assignment/screens/feed/details.dart';
import 'package:assignment/services/firestore/user_info_store.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;


class Post extends StatefulWidget {
  const Post({required this.date, required this.imagePath, required this.description, super.key});

  final DateTime date;
  final String imagePath;
  final String description;
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var timeAgo;
  @override
  void initState() {
    timeAgo = timeago.format(widget.date);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Details(
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
                              title: const StyledBodySmall("Que souhaitez vous faire ?"),
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: (){},
                                  child: const Text("Signalez cette publication", style: TextStyle(color: Colors.red),),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: (){},
                                  child: const Text("Supprimer la publication", style: TextStyle(color: Colors.red),),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: CupertinoActionSheetAction(
                                    onPressed: (){},
                                    isDestructiveAction: true,
                                    child: const Text("Close", style: TextStyle(color: Colors.blue),),
                                  ),
                                ),
                              ],
                            );
                          });
                        },
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(8),
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
                              backgroundImage: NetworkImage(Provider.of<UserInfoStore>(context).userInfo[0].image),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    StyledTitleSmall(Provider.of<UserInfoStore>(context).userInfo[0].firstName),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    StyledTitleSmall(Provider.of<UserInfoStore>(context).userInfo[0].lastName),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    StyledBodySmall("$timeAgo"),
                                  ],
                                ),
                                StyledBodySmall(widget.description)
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
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
