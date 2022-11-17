import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mop/app/modules/authentication/views/signin.dart';
import 'package:mop/app/modules/authentication/views/signup.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(
          height: 0,
        ),
      ),
      body: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              // height: 300,
              child: Image.asset("assets/images/logo.png"),
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.to(const SignupView());
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
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    Get.to(const SigninView());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        Get.isDarkMode ? Colors.transparent : Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(color: Colors.red, width: 10.0)),
                    fixedSize: const Size(350, 50),
                  ),
                  child: Text(
                    "Je me connecte",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
