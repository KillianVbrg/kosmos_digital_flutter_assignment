import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';

class ProfileSecurityEmail extends StatefulWidget {
  const ProfileSecurityEmail({super.key});

  @override
  State<ProfileSecurityEmail> createState() => _ProfileSecurityEmailState();
}

class _ProfileSecurityEmailState extends State<ProfileSecurityEmail> {
  final TextEditingController emailController = TextEditingController();

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
              label: "Adresse mail*",
              hint: "email@gmail.com",
              isHidden: false,
              controller: emailController,
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
                          const StyledHeadlineLarge(text: "Confirmez votre adresse mail", centered: true,)
                        ],
                      ),
                      content: const StyledHeadlineSmall(text: "Vous venez de recevoir un mail de vérification sur john******com.", centered: true,),
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
