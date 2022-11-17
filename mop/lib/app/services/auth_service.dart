import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mop/app/modules/home/views/home_view.dart';
import 'package:mop/app/modules/onboarding/views/onboarding_view.dart';
import 'package:mop/app/modules/splash/views/splash_view.dart';

import '../components/snackbar.dart';

class ServiceAuth {
  static final firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredentialData =
            await firebaseAuth.signInWithCredential(credential);

        ///Here to check isNewUser OR Not
        if (userCredentialData.additionalUserInfo!.isNewUser) {
          await Get.to(() => const HomeView());
        } else {
          await Get.offAllNamed('/home');
        }
      }
    } catch (ex) {
      Get.back();
      CustomSnackBar().getSnackBar('Sign In Error', 'Error Signing in');
    }
  }

  static Future<void> signIn({String? email, String? password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      CustomSnackBar().getSnackBar('Sign in', 'Signing ');
    } on FirebaseAuthException catch (e) {
      CustomSnackBar().getSnackBar('Sign In Error', 'Error Signing in');
    }
  }

  static Future<void> signUp(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        CustomSnackBar().getSnackBar('The password provided is too weak.', '');
      } else if (e.code == 'email-already-in-use') {
        CustomSnackBar()
            .getSnackBar('The account already exists for that email.', '');
      }
    } catch (e) {
      print(e);
      CustomSnackBar().getSnackBar('$e', '');
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await _googleSignIn.signOut();

    await Get.offAll(() => const OnboardingView());
  }
}
