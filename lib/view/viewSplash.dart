import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  AppDataController appCtrl = Get.find<AppDataController>();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if(appCtrl.userName == '' && appCtrl.userMail == ''){
        Get.offAndToNamed(mainPage);
      } else {
        Get.offAndToNamed(mainPage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      body: Center(
        child: Image.asset('assets/images/splashLogo.png')
      ),
    );
  }
}
