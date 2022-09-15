import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:an_app_vone/app/widgets/splash.dart';

import 'app/routes/app_pages.dart';
import 'model/an_response.dart';


void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var scrollController = ScrollController();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute: Routes.HOME,
              getPages: AppPages.routes,
            );
          }
        });
  }
}
