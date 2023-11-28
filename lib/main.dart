import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harca/view/viewAddAlert.dart';
import 'package:harca/view/viewAllExpense.dart';
import 'package:harca/view/viewExpenseFilter.dart';
import 'package:harca/view/viewHomePage.dart';
import 'package:harca/view/viewMainPage.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Harca',
        initialRoute: '/',
        routes: {
          '/' : (context) => const MainPage(),
          '/homePage' : (context) => const HomePage(),
          '/addAlert' : (context) => const AddAlert(),
          '/expenseFilter' : (context) => const ExpenseFilter(),
          '/allExpense' : (context) => const AllExpense(),
        },
      ),
    );
  }
}

