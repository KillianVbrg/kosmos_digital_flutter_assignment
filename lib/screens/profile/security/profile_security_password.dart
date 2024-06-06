import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';

class ProfileSecurityPassword extends StatefulWidget {
  const ProfileSecurityPassword({super.key});

  @override
  State<ProfileSecurityPassword> createState() => _ProfileSecurityPasswordState();
}

class _ProfileSecurityPasswordState extends State<ProfileSecurityPassword> {
  late bool isHidden = true;

  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledHeadlineMedium("Adresse mail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            StyledTextField(
              label: "Mot de passe actuel*",
              hint: "Mot de passe",
              isHidden: isHidden,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: const Icon(
                    Icons.remove_red_eye
                ),
              ),
              controller: currentPasswordController,
            ),
            const SizedBox(
              height: 15,
            ),
            StyledTextField(
              label: "Nouveau mot de passe*",
              hint: "Nouveau mot de passe",
              isHidden: isHidden,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: const Icon(
                    Icons.remove_red_eye
                ),
              ),
              controller: newPasswordController,
            ),
            const SizedBox(
              height: 15,
            ),
            StyledTextField(
              label: "Confirmez le nouveau mot de passe*",
              hint: "Confirmez le nouveau mot de passe",
              isHidden: isHidden,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: const Icon(
                    Icons.remove_red_eye
                ),
              ),
              controller: newPasswordConfirmationController,
            ),
            const SizedBox(
              height: 20,
            ),
            StyledButton(
                  () {
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
                          const StyledHeadlineLarge(text: "Vérifiez votre boite mail", centered: true,)
                        ],
                      ),
                      content: const StyledHeadlineSmall(text: "Vos nouveaux identifiants vous ont été envoyés par mail !", centered: true,),
                      actions: [
                        StyledButton(
                              () {
                            return Navigator.pop(context);
                          },
                          const StyledTitleSmall("Fermer"),
                        ),
                      ],
                    );
                  },
                );
              },
              const StyledTitleSmall("Modifier") ,
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
