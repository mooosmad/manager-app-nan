// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mop/app/components/background.dart';
import 'package:mop/app/modules/authentication/views/signup.dart';

import '../../../utils/constants/loading.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  TextEditingController contact = TextEditingController();
  TextEditingController password = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool load = false;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
                "CONNEXION",
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
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            controller: contact,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Champ vide";
                              }
                              return null;
                            },
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
                              hintStyle: Theme.of(context).textTheme.bodyText2,
                            ),
                            cursorColor:
                                Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: TextFormField(
                            controller: password,
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
                            keyboardType: TextInputType.visiblePassword,
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
                              hintStyle: Theme.of(context).textTheme.bodyText2,
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
                        SizedBox(height: size.height * 0.05),
                        OutlinedButton(
                          onPressed: () {
                            // Get.to(const Signup());
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
                            "Je me connecte",
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
                              Get.to(const SignupView());
                            },
                            child: Text(
                              "Je n'ai pas de compte, Je m'inscris",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
