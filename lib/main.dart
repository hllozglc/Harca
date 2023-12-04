import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:harca/core/controller/MainBindings.dart';
import 'package:harca/view/viewAddAlert.dart';
import 'package:harca/view/viewAddAlertForm.dart';
import 'package:harca/view/viewAddCardForm.dart';
import 'package:harca/view/viewAddCardList.dart';
import 'package:harca/view/viewAddCategory.dart';
import 'package:harca/view/viewExpenseFilter.dart';
import 'package:harca/view/viewMainPage.dart';


void main() {
  MainBindings().dependencies();
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
        title: 'Harca',
        initialRoute: '/',
        getPages: [
          GetPage(name: mainPage, page: () => const MainPage(),),
          GetPage(name: addAlert, page: () => const AddAlert(),),
          GetPage(name: addAlertForm, page: () => const AddAlertForm(),),
          GetPage(name: expenseFilter, page: () => const ExpenseFilter(),),
          GetPage(name: addCard, page: () => const AddCard(),),
          GetPage(name: addCardForm, page: () => const CardForm(),),
          GetPage(name: addCategory, page: () => const AddCategory(),),
        ],
      ),
    );
  }
}

String get mainPage => '/';
String get addAlert => '/addAlert';
String get addAlertForm => '/addAlertForm';
String get expenseFilter => '/expenseFilter';
String get addCard => '/addCard';
String get addCardForm => '/addCardForm';
String get addCategory => '/addCategory';