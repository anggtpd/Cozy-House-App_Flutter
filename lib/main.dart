import 'dart:ui';

import 'package:bwa_cozy/pages/splash_page.dart';
import 'package:bwa_cozy/providers/controller.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Get.put(DataController()).darkTheme;
    Get.put(DataController()).loadTheme();
    return GetBuilder<DataController>(
        init: DataController(),
        builder: (data) {
          return GetMaterialApp(
            theme: Styles.themeData(data.darkTheme),
            home: SplashPage(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
