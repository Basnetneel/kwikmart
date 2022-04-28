import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwik_mart/home.dart';
import 'package:kwik_mart/login/constants/firebase.dart';
import 'package:kwik_mart/login/controllers/appcontroller.dart';
import 'package:kwik_mart/login/controllers/authcontroller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AppController());
    Get.put(UserController());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

}