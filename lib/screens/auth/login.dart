import 'package:assignment/constants/colors.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool isHidden = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailResetPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              StyledHeadlineLargest(text: "Connectez-vous à votre compte", centered: true,),
              SizedBox(
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledTextField(
                    label: "Adresse mail",
                    hint: "john.doe@gmail.com",
                    isHidden: false,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  StyledTextField(
                    label: "Mot de passe",
                    hint: "Mot de passe",
                    isHidden: isHidden,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye
                      ),
                    ),
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StyledBodySmall("Mot de passe oublié ?"),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(30),
                              ),
                            ),
                            showDragHandle: true,
        
                            backgroundColor: Colors.white,
                            builder: (context) => Container(
                              padding: EdgeInsets.all(25),
                              width: double.infinity,
                              height: 400,
                              child: Column(
                                children: [
                                  StyledHeadlineMedium("Réinitialiser mot de passe"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  StyledHeadlineSmall(text: "Entrez l’adresse email associée à votre compte. Nous vous enverrons un email de réinitialisation sur celle-ci.", centered: true,),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    children: [
                                      StyledTextField(
                                        label: "Adresse mail",
                                        hint: "john.doe@gmail.com",
                                        isHidden: false,
                                        controller: emailResetPasswordController,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      StyledButton(
                                        () => {
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
                                                      icon: Icon(
                                                        Icons.close,
                                                        color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                    StyledHeadlineLarge(text: "Vérifiez votre boîte mail", centered: true,)
                                                  ],
                                                ),
                                                content: StyledHeadlineSmall(text: "Vous avez reçu un mail afin de réinitialiser votre mot de passe.", centered: true,),
                                                actions: [
                                                  StyledButton(
                                                    () {
                                                      return Navigator.pop(context);
                                                    },
                                                    StyledTitleSmall("Fermer"),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        },
                                        StyledTitleSmall("Réinitialiser"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Réinitialiser",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  StyledButton(
                    () => {},
                    StyledTitleSmall("Connexion"),
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
