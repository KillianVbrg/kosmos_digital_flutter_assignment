import 'package:assignment/constants/colors.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({required this.user, required this.imagePath, super.key});

  final String user;
  final String imagePath;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [AppColors.primaryColor.withOpacity(0.75), Colors.transparent], begin: Alignment.centerRight, end: Alignment.centerLeft)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.25),
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
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
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.25),
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.more_vert_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [AppColors.primaryColor.withOpacity(0.75), Colors.transparent], begin: Alignment.centerRight, end: Alignment.centerLeft)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(30),
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                StyledTitleSmall("User's name"),
                                SizedBox(
                                  width: 10,
                                ),
                                StyledBodySmall("22 min"),
                              ],
                            ),
                            // StyledBodySmall("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed est tortor, maximus sed enim id, lacinia malesuada mauris. Suspendisse pharetra nulla feugiat, pellentesque nulla in, ornare turpis. Nunc sodales tristique fringilla. Maecenas facilisis orci eget libero iaculis, vitae eleifend nulla aliquam. Cras neque felis, semper id eros vestibulum, elementum congue ante. Nam egestas, eros nec pretium pretium, lectus nunc porta nibh, eget gravida nisi magna in eros. Aenean non turpis et lorem rhoncus aliquet. Fusce condimentum fringilla neque, sit amet sodales velit molestie ac. Praesent vitae ipsum efficitur, pulvinar dui et, rhoncus orci. Curabitur id arcu est. Morbi congue odio sit amet faucibus consectetur. Suspendisse sapien erat, convallis viverra metus ac, condimentum facilisis urna. Morbi a metus sit amet velit fringilla ullamcorper nec vitae elit.")
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
      )
    );
  }
}
