import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:task_scheduler/View/homepage.dart';
import 'package:task_scheduler/auth/sign_in/sign_in.dart';

import 'View/home_screen.dart';
import 'auth/sign_in/sign_in_model.dart';
import 'auth/sign_in/sign_in_controller.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SignInModel()),
    ChangeNotifierProvider(create: (_) => SignInProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Scheduler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromARGB(255, 111, 13, 2),
        brightness: Brightness.light,
      ),
      home: SignInScreen(),
    );
  }
}
