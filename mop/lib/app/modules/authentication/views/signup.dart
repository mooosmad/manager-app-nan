// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mop/app/modules/authentication/views/signin.dart';
import 'package:mop/app/services/auth_service.dart';
import '../../../components/background.dart';
import '../../../utils/constants/loading.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retapassword = TextEditingController();
  bool _obscureText = true;
  bool _obscureRText = true;
  bool load = false;
  final formGlobalKey = GlobalKey<FormState>();
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggler() {
    setState(() {
      _obscureRText = !_obscureRText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return load
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "INSCRIPTION",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              leading: const SizedBox(width: 0),
              elevation: 0,
              centerTitle: true,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Background(
                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: nom,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Champ vide";
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Get.isDarkMode
                                  ? Colors.black38
                                  : Colors.white54,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              hintText: 'Nom',
                              hintStyle: Theme.of(context).textTheme.bodyText2!,
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: prenom,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Champ vide";
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 15,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Get.isDarkMode
                                  ? Colors.black38
                                  : Colors.white54,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              hintText: 'Prenom',
                              hintStyle: Theme.of(context).textTheme.bodyText2!,
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: mail,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Champ vide";
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 15,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              fillColor: Get.isDarkMode
                                  ? Colors.black38
                                  : Colors.white54,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              hintText: 'Email',
                              hintStyle: Theme.of(context).textTheme.bodyText2!,
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: password,
                            validator: ((value) {
                              if (value!.length < 6) {
                                return "Mot de passe trop court";
                              } else if (value.isEmpty) {
                                return "Champ vide";
                              }
                              return null;
                            }),
                            style: TextStyle(
                              fontSize: 15,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              fillColor: Get.isDarkMode
                                  ? Colors.black38
                                  : Colors.white54,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              hintText: 'Mot de passe',
                              hintStyle: Theme.of(context).textTheme.bodyText2!,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _toggle();
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off_sharp,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: retapassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Champ vide";
                              } else if (value != password.text) {
                                return "mot de passe different";
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 15,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            obscureText: _obscureRText,
                            decoration: InputDecoration(
                              fillColor: Get.isDarkMode
                                  ? Colors.black38
                                  : Colors.white54,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              hintText: 'Confirmez votre mot de passe',
                              hintStyle: Theme.of(context).textTheme.bodyText2!,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _toggler();
                                },
                                child: Icon(
                                  _obscureRText
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off_sharp,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),
                        OutlinedButton(
                          onPressed: () {
                            if (formGlobalKey.currentState!.validate()) {
                              ServiceAuth.signUp(
                                  email: "$mail", password: "$password");
                              Get.offAllNamed('/home');
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                            elevation: 1,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(5.0),
                            // ),
                            fixedSize: const Size(350, 50),
                          ),
                          child: Text(
                            "Je m'inscris",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Get.isDarkMode
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.08),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              Get.off(const SigninView(),
                                  transition: Transition.leftToRight);
                            },
                            child: Text(
                              "J'ai déjà un compte? Je me connecte",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.08),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
