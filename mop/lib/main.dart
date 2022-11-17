import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mop/app/utils/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

late bool isFirst;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  String? theme = prefs.getString('theme') ?? 'dark';
  isFirst = prefs.getBool('isFirst') ?? true;

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 804),
      builder: (context, w) {
        return GetMaterialApp(
          title: "Mop",
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: ThemeMop.ligthTheme,
        );
      },
    ),
  );
}
