import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:harca/view/viewAddAlert.dart';
import 'package:harca/view/viewExpenseFilter.dart';
import 'package:harca/view/viewHomePage.dart';
import 'package:harca/view/viewMainPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: mainPage,
        getPages: [
          GetPage(name: mainPage, page: () => const MainPage()),
          GetPage(name: addAlert, page: () => const AddAlert()),
          GetPage(name: exPenseFilter, page: () => const ExpenseFilter()),
        ],

      ),
    );
  }
  String get mainPage => '/mainPage';
  String get addAlert => '/addAlert';
  String get exPenseFilter => '/expenseFilter';

}

