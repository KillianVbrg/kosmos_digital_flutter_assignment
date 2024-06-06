import 'package:assignment/models/app_user.dart';
import 'package:assignment/models/user_info.dart' as UserInfoModel; // sinon collision avec UserInfo the Firebase Auth
import 'package:assignment/screens/auth/onboarding.dart';
import 'package:assignment/services/auth/auth_service.dart';
import 'package:assignment/services/firestore/user_info_store.dart';
import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late bool isHidden = true;
  late bool CGVUAccepted = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();

  String? _errorFeedback;

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
              const StyledHeadlineLargest(text: "Connectez-vous à votre compte", centered: true),
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
                  StyledTextField(
                    label: "Confirmation de mot de passe",
                    hint: "Confirmation de mot de passe",
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
                    controller: passwordConfirmationController,
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
                    () {
                      final email = emailController.text.trim();
                      final password = passwordController.text;
                      final passwordConfirmation = passwordConfirmationController.text;
                      final isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email);
                      if(isEmailValid && password.length > 7 && (password == passwordConfirmation)){
                        setState(() {
                          _errorFeedback = null;
                        });

                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(30),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          scrollControlDisabledMaxHeightRatio: 700,
                          showDragHandle: true,

                          builder: (context) => Container(
                            padding: const EdgeInsets.all(25),
                            width: double.infinity,
                            height: 700,
                            child: Scrollbar(
                              trackVisibility: true,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const StyledHeadlineMedium("CGVU et politique de confidentialité"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const StyledHeadlineSmall(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam laoreet, nisi a pretium interdum, quam nibh elementum nulla, ac lobortis risus eros ut ante. Maecenas porttitor est eu dui elementum rhoncus. Sed convallis ligula mi, nec convallis augue mattis ut. Nunc purus lacus, faucibus nec mollis et, congue nec sem. Morbi justo turpis, iaculis id efficitur sit amet, tincidunt sed ante. Suspendisse ac orci diam. Sed nibh arcu, egestas at quam tristique, tincidunt mollis purus. Aenean in lectus varius, maximus justo at, facilisis enim. Sed maximus elit non maximus lobortis. Etiam sit amet ex finibus, ultrices dui nec, hendrerit diam. Vestibulum sed vestibulum nibh. Nullam rutrum lobortis dolor, eu molestie augue scelerisque quis. Aliquam a lacus sem.\n\nAliquam at tellus ut dui semper auctor. Suspendisse porttitor diam nec tortor vestibulum, nec mattis neque suscipit. Fusce mattis auctor nisl, eget dignissim erat molestie nec. Sed fermentum quis nisl at tincidunt. Mauris ut cursus nulla, eget egestas lacus. Nulla facilisi. Duis quis sem pulvinar, tincidunt urna in, vestibulum risus. Nulla ut convallis nibh. Nulla sit amet mi ut libero posuere auctor id quis nunc.\n\nSuspendisse potenti. Pellentesque blandit tristique neque quis convallis. Cras viverra id ligula non condimentum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum vitae ullamcorper lectus. Nam bibendum sodales est at efficitur. Mauris eu nunc nec magna varius consectetur. Fusce in tristique sapien. Ut eget vestibulum ante. Cras id hendrerit felis, mattis tristique diam. Donec ullamcorper tortor ac lobortis accumsan. Vestibulum placerat convallis nulla, in tincidunt massa pellentesque vitae. Maecenas eu tortor a nisi molestie dignissim.\n\nInteger feugiat odio at metus dapibus, ac sollicitudin dui auctor. Suspendisse ullamcorper lacus arcu, sed convallis dolor mollis non. Vestibulum lobortis lobortis efficitur. Maecenas vel tortor hendrerit, feugiat turpis ac, dapibus arcu. Proin hendrerit nec nisi scelerisque pellentesque. Phasellus elementum suscipit tempor. In hac habitasse platea dictumst. Nullam ultrices, leo non vehicula tincidunt, ante justo imperdiet est, non vestibulum lacus risus pulvinar felis. Morbi eros nulla, egestas dictum lectus sit amet, efficitur consequat orci. Aliquam erat volutpat. Proin quis ligula sapien. Proin gravida, diam at mollis consectetur, est eros ullamcorper nulla, ut scelerisque odio ligula aliquam massa. Etiam vitae lectus eros. Nunc quis ligula vel diam cursus luctus a tincidunt nisi. Cras ullamcorper quam at rutrum vulputate.\n\nCurabitur tincidunt turpis vitae eros pulvinar tempor. Proin auctor viverra risus, nec venenatis magna hendrerit non. Integer ut felis rutrum, elementum metus sed, volutpat ipsum. Curabitur pellentesque, augue in tincidunt dapibus, nisi urna accumsan est, eu auctor quam purus ac odio. Sed volutpat leo nec velit suscipit, eget auctor magna fermentum. Cras placerat blandit leo, non aliquet dui sollicitudin vitae. Aliquam sed mi est. Ut ullamcorper egestas sapien, ut maximus lectus laoreet sit amet. Aenean sed est rhoncus ligula sodales volutpat. Fusce nec arcu mauris. Cras luctus est nibh, sit amet bibendum risus mollis et. Morbi at elit sed odio rutrum sollicitudin quis ut libero.", centered: false,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    StatefulBuilder(
                                      builder: (context, setState) {
                                        return Column(
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                    value: CGVUAccepted,
                                                    onChanged: (value){
                                                      setState(() {
                                                        CGVUAccepted = value!;
                                                      });
                                                    }
                                                ),
                                                const Expanded(child: StyledBodyMedium(text: "J'accepte la politque de confidentialité et les conditions générales d'utilisation.*", centered: false,)),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            StyledButton(
                                              CGVUAccepted == false ? null : () async {
                                                final email = emailController.text.trim();
                                                final password = passwordController.text;
                                                final AppUser? user = await AuthService.signUp(email, password);

                                                if(user != null){
                                                  Navigator.pop(context);
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) => AlertDialog(
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
                                                          const StyledHeadlineLarge(text: "Vérifiez votre boite mail", centered: true, ),
                                                        ],
                                                      ),
                                                      content: StyledHeadlineSmall(
                                                        text: "Un mail de vérification vous a été envoyé à l'adresse ${emailController.text.trim()}",
                                                        centered: true,
                                                      ),
                                                      actions: [
                                                        StyledButton(
                                                          () async {
                                                            final userId = FirebaseAuth.instance.currentUser!.uid;


                                                            Provider.of<UserInfoStore>(context, listen: false).setUserInfo(UserInfoModel.UserInfo(id: uuid.v4(), userId: userId, firstName: "", lastName: "", datePasswordUpdate: DateTime.now(), image: "", notification: false));

                                                            Provider.of<UserInfoStore>(context, listen: false).fetchUserInfo(userId);

                                                            Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => const Onboarding()), (route) => false);
                                                          },
                                                          const StyledTitleSmall("Fermer"),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                              },
                                              const StyledTitleSmall("Continuer"),
                                            )
                                          ],
                                        );
                                      }
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        setState(() {
                          _errorFeedback = "L'adresse mail ou le mot de passe est incorrect (au moins 8 charactères) ou les mots de passe ne sont pas identiques";
                        });
                      }

                    },
                    const StyledTitleSmall("Continuer"),
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
