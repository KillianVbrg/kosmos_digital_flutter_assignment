import 'package:assignment/widgets/button.dart';
import 'package:assignment/widgets/text_field.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';

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
              StyledHeadlineLargest(text: "Connectez-vous à votre compte", centered: true),
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
                      icon: Icon(
                          Icons.remove_red_eye
                      ),
                    ),
                    controller: passwordConfirmationController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  StyledButton(
                    () => {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        scrollControlDisabledMaxHeightRatio: 700,
                        showDragHandle: true,

                    builder: (context) => Container(
                          padding: EdgeInsets.all(25),
                          width: double.infinity,
                          height: 700,
                          child: Scrollbar(
                            trackVisibility: true,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  StyledHeadlineMedium("CGVU et politique de confidentialité"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  StyledHeadlineSmall(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam laoreet, nisi a pretium interdum, quam nibh elementum nulla, ac lobortis risus eros ut ante. Maecenas porttitor est eu dui elementum rhoncus. Sed convallis ligula mi, nec convallis augue mattis ut. Nunc purus lacus, faucibus nec mollis et, congue nec sem. Morbi justo turpis, iaculis id efficitur sit amet, tincidunt sed ante. Suspendisse ac orci diam. Sed nibh arcu, egestas at quam tristique, tincidunt mollis purus. Aenean in lectus varius, maximus justo at, facilisis enim. Sed maximus elit non maximus lobortis. Etiam sit amet ex finibus, ultrices dui nec, hendrerit diam. Vestibulum sed vestibulum nibh. Nullam rutrum lobortis dolor, eu molestie augue scelerisque quis. Aliquam a lacus sem.\n\nAliquam at tellus ut dui semper auctor. Suspendisse porttitor diam nec tortor vestibulum, nec mattis neque suscipit. Fusce mattis auctor nisl, eget dignissim erat molestie nec. Sed fermentum quis nisl at tincidunt. Mauris ut cursus nulla, eget egestas lacus. Nulla facilisi. Duis quis sem pulvinar, tincidunt urna in, vestibulum risus. Nulla ut convallis nibh. Nulla sit amet mi ut libero posuere auctor id quis nunc.\n\nSuspendisse potenti. Pellentesque blandit tristique neque quis convallis. Cras viverra id ligula non condimentum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum vitae ullamcorper lectus. Nam bibendum sodales est at efficitur. Mauris eu nunc nec magna varius consectetur. Fusce in tristique sapien. Ut eget vestibulum ante. Cras id hendrerit felis, mattis tristique diam. Donec ullamcorper tortor ac lobortis accumsan. Vestibulum placerat convallis nulla, in tincidunt massa pellentesque vitae. Maecenas eu tortor a nisi molestie dignissim.\n\nInteger feugiat odio at metus dapibus, ac sollicitudin dui auctor. Suspendisse ullamcorper lacus arcu, sed convallis dolor mollis non. Vestibulum lobortis lobortis efficitur. Maecenas vel tortor hendrerit, feugiat turpis ac, dapibus arcu. Proin hendrerit nec nisi scelerisque pellentesque. Phasellus elementum suscipit tempor. In hac habitasse platea dictumst. Nullam ultrices, leo non vehicula tincidunt, ante justo imperdiet est, non vestibulum lacus risus pulvinar felis. Morbi eros nulla, egestas dictum lectus sit amet, efficitur consequat orci. Aliquam erat volutpat. Proin quis ligula sapien. Proin gravida, diam at mollis consectetur, est eros ullamcorper nulla, ut scelerisque odio ligula aliquam massa. Etiam vitae lectus eros. Nunc quis ligula vel diam cursus luctus a tincidunt nisi. Cras ullamcorper quam at rutrum vulputate.\n\nCurabitur tincidunt turpis vitae eros pulvinar tempor. Proin auctor viverra risus, nec venenatis magna hendrerit non. Integer ut felis rutrum, elementum metus sed, volutpat ipsum. Curabitur pellentesque, augue in tincidunt dapibus, nisi urna accumsan est, eu auctor quam purus ac odio. Sed volutpat leo nec velit suscipit, eget auctor magna fermentum. Cras placerat blandit leo, non aliquet dui sollicitudin vitae. Aliquam sed mi est. Ut ullamcorper egestas sapien, ut maximus lectus laoreet sit amet. Aenean sed est rhoncus ligula sodales volutpat. Fusce nec arcu mauris. Cras luctus est nibh, sit amet bibendum risus mollis et. Morbi at elit sed odio rutrum sollicitudin quis ut libero.", centered: false,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Checkbox(
                                            value: CGVUAccepted,
                                            onChanged: (value){
                                              setState(() {
                                                CGVUAccepted = value!;
                                              });
                                            }
                                          );
                                        }
                                      ),
                                      Expanded(child: StyledBodyMedium(text: "J'accepte la politque de confidentialité et les conditions générales d'utilisation.", centered: false,)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  StyledButton(
                                    () => {
                                      if(CGVUAccepted){
                                        Navigator.pop(context),
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
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                                StyledHeadlineLarge(text: "Vérifiez votre boite mail", centered: true, ),
                                              ],
                                            ),
                                            content: StyledHeadlineSmall(
                                              text: "Un mail de vérification vous a été envoyé à l'adresse dummy@gmail.com}",
                                              centered: true,
                                            ),
                                            actions: [
                                              StyledButton(
                                                    () => {
                                                  Navigator.pop(context)
                                                },
                                                StyledTitleSmall("Fermer"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      }
                                    },
                                    StyledTitleSmall("Continuer"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    },
                    StyledTitleSmall("Continuer"),
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
