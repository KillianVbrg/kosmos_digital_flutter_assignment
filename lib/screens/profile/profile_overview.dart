import 'dart:io';

import 'package:assignment/constants/colors.dart';
import 'package:assignment/screens/placeholder_screen.dart';
import 'package:assignment/screens/profile/info/profile_modify_info.dart';
import 'package:assignment/screens/profile/security/profile_security.dart';
import 'package:assignment/services/auth/auth_service.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/profile_tile.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileOverview extends StatefulWidget {
  const ProfileOverview({super.key});

  @override
  State<ProfileOverview> createState() => _ProfileOverviewState();
}

class _ProfileOverviewState extends State<ProfileOverview> {
  bool isSwitched = false;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: (){
                showCupertinoModalPopup(context: context, builder: (context) {
                  return CupertinoActionSheet(
                    title: const StyledBodySmall("Que souhaitez vous faire ?"),
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: (){
                          AuthService.signOut();
                        },
                        child: const Text("Se déconnecter", style: TextStyle(color: Colors.red),),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () => {
                          Navigator.pop(context),
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                              title: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const StyledHeadlineLarge(text: "Supprimer mon compte", centered: true,)
                                ],
                              ),
                                content: const StyledHeadlineSmall(
                                  text: "Souhaitez-vous vraiment supprimer votre compte ?",
                                  centered: true,
                                ),
                                actions: [
                                  StyledButton(
                                        () {
                                      return Navigator.pop(context);
                                    },
                                    const StyledTitleSmall("Oui"),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: TextButton(
                                        onPressed: () {
                                        return Navigator.pop(context);
                                      },
                                      child: const StyledHeadlineMedium("Non"),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        },
                        child: const Text("Supprimer mon profil", style: TextStyle(color: Colors.red),),
                      ),
                      Container(
                        color: Colors.white,
                        child: CupertinoActionSheetAction(
                          onPressed: (){},
                          isDestructiveAction: true,
                          child: const Text("Annuler", style: TextStyle(color: Colors.blue),),
                        ),
                      ),
                    ],
                  );
                });
              },
              child: const Icon(Icons.more_horiz_rounded),
            )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage("assets/profile_placeholder_2.png"), fit: BoxFit.fill)
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: (){
                          showCupertinoModalPopup(context: context, builder: (context) {
                            return CupertinoActionSheet(
                              title: const StyledBodySmall("Que souhaitez vous faire ?"),
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: () async {
                                    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

                                    if(returnedImage == null) return;

                                    Navigator.pop(context);
                                    setState(() {
                                      selectedImage = File(returnedImage.path);
                                    });
                                  },
                                  child: const Text("Prendre une photo/vidéo", style: TextStyle(color: Colors.blue),),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: () async {
                                    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

                                    if(returnedImage == null) return;

                                    Navigator.pop(context);
                                    setState(() {
                                      selectedImage = File(returnedImage.path);
                                    });
                                  },
                                  child: const Text("Bibliothèque photos/vidéos", style: TextStyle(color: Colors.blue),),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: CupertinoActionSheetAction(
                                    onPressed: (){},
                                    isDestructiveAction: true,
                                    child: const Text("Annuler", style: TextStyle(color: Colors.blue),),
                                  ),
                                ),
                              ],
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor.withOpacity(0.5),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
              const StyledHeadlineLarge(text: "Anna Clark", centered: true),
              const StyledHeadlineSmall(text: "emial@gmail.com", centered: true),
              Divider(color: Colors.grey[300]),
              const SizedBox(
                height: 15,
              ),
          
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StyledHeadlineMedium("Mon compte"),
                  ProfileTile(
                    prefix: "assets/profile_placeholder_2.png",
                    text: "Anna Clark",
                    subText: "email@gamil.co",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileModifyInfo()));
                    },
                  ),
                  ProfileTile(
                    prefix: Icons.lock_open_rounded,
                    text: "Sécurité",
                    subText: "Mot de passe, mail, ...",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSecurity()));
                    },
                  ),
          
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: StyledHeadlineMedium("Paramètres"),
                  ),
                  ProfileTile(
                    prefix: Icons.notifications_none_rounded,
                    text: "Notifications push",
                    subText: "Activés",
                    suffix: Switch.adaptive(
                      value: isSwitched,
                      activeTrackColor: AppColors.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      }
                    ),
                    redirect: (){},
                  ),
          
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: StyledHeadlineMedium("Autres"),
                  ),
                  ProfileTile(
                    prefix: Icons.question_mark_rounded,
                    text: "Aide",
                    subText: "Contactez-nous en partageant l'app",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen()));
                    },
                  ),
                  ProfileTile(
                    prefix: Icons.share_rounded,
                    text: "Partager l'app",
                    subText: "Soutenez-nous en partageant l'app",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen()));
                    },
                  ),
          
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: StyledHeadlineMedium("Liens"),
                  ),
                  ProfileTile(
                    text: "Politique de confidentialité",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen()));
                    },
                  ),
                  ProfileTile(
                    text: "Conditions générales de ventes et\nd'utilisation",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen()));
                    },
                  ),
                  ProfileTile(
                    text: "Mentions légales",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen()));
                    },
                  ),
                  ProfileTile(
                    text: "À propos",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen()));
                    },
                  ),
          
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: StyledHeadlineMedium("Réseaux sociaux"),
                  ),
                  ProfileTile(
                    prefix: "assets/icons/facebook.png",
                    text: "Notre page Facebook",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: () async {
                      final url = Uri.parse("https://www.facebook.com");
                      await launchUrl(url);
                    },
                  ),
                  ProfileTile(
                    prefix: "assets/icons/instagram.png",
                    text: "Notre Instagram",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: () async {
                      final url = Uri.parse("https://www.instagram.com");
                      await launchUrl(url);
                    },
                  ),
                  ProfileTile(
                    prefix: "assets/icons/snapchat.png",
                    text: "Notre Snachat",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: () async {
                      final url = Uri.parse("https://www.snapchat.com");
                      await launchUrl(url);
                    },
                  ),
                  ProfileTile(
                    prefix: "assets/icons/twitter.png",
                    text: "Notre Twitter",
                    suffix: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 20,),
                    redirect: () async {
                      final url = Uri.parse("https://www.x.com");
                      await launchUrl(url);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          "Édité par "
                      ),
                      GestureDetector(
                        onTap: () async {
                          final url = Uri.parse("https://www.kosmos-digital.com");
                          await launchUrl(url);
                        },
                        child: const Text(
                          "kosmos-digital.com",
                          style: TextStyle(
                            decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
