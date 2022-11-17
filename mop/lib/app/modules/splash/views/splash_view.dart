// ignore_for_file: must_be_immutable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../authentication/views/authentication_view.dart';
import '../../home/views/home_view.dart';
import '../../onboarding/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logo.png',
      splashIconSize: 250,
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      nextScreen: CheckAuth(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}

class CheckAuth extends StatelessWidget {
  CheckAuth({super.key});

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (currentUser != null) {
      child = const HomeView();
    } else {
      if (isFirst) {
        child = const OnboardingView();
      } else {
        child = const AuthenticationView();
      }
    }
    return Scaffold(
      body: child,
    );
  }
}
