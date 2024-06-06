import 'package:assignment/constants/colors.dart';
import 'package:assignment/screens/feed/feed.dart';
import 'package:assignment/services/auth/auth_service.dart';
import 'package:assignment/services/firestore/user_info_store.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  String? _errorFeedback;

  @override
  void dispose() {


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const StyledHeadlineLargest(text: "Connectez-vous à votre compte", centered: true,),
              const SizedBox(
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
                  const SizedBox(
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
                      icon: const Icon(
                        Icons.remove_red_eye
                      ),
                    ),
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const StyledBodySmall("Mot de passe oublié ?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(30),
                              ),
                            ),
                            showDragHandle: true,

                            backgroundColor: Colors.white,
                            builder: (context) => Container(
                              padding: const EdgeInsets.all(25),
                              width: double.infinity,
                              height: 400,
                              child: Column(
                                children: [
                                  const StyledHeadlineMedium("Réinitialiser mot de passe"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const StyledHeadlineSmall(text: "Entrez l’adresse email associée à votre compte. Nous vous enverrons un email de réinitialisation sur celle-ci.", centered: true,),
                                  const SizedBox(
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
                                      const SizedBox(
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
                                                      icon: const Icon(
                                                        Icons.close,
                                                        color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                    const StyledHeadlineLarge(text: "Vérifiez votre boîte mail", centered: true,)
                                                  ],
                                                ),
                                                content: const StyledHeadlineSmall(text: "Vous avez reçu un mail afin de réinitialiser votre mot de passe.", centered: true,),
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
                                          ),
                                        },
                                        const StyledTitleSmall("Réinitialiser"),
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
                  const SizedBox(
                    height: 30,
                  ),
                  if(_errorFeedback != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_errorFeedback!, style: const TextStyle(color: Colors.red),),
                        const SizedBox(
                          height: 5,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  StyledButton(
                    () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text;
                      final isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email);
                      if(isEmailValid && password.length > 7){
                        setState(() {
                          _errorFeedback = null;
                        });

                        final email = emailController.text.trim();
                        final password = passwordController.text;

                        final user = await AuthService.signIn(email, password);

                        if(user == null){
                          setState(() {
                            _errorFeedback = "L'adresse mail ou le mot de passe est incorrect";
                          });
                        } else {
                          Provider.of<UserInfoStore>(context, listen: false).fetchUserInfo(user.uid);
                          Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => const Feed()), (route) => false);
                        }
                      } else {
                        setState(() {
                          _errorFeedback = "L'adresse mail ou le mot de passe (au moins 8 charactères) est incorrect";
                        });
                      }
                    },
                    const StyledTitleSmall("Connexion"),
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
