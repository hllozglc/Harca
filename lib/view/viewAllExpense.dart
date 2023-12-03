import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/widget/MyListView.dart';
import 'package:harca/widget/emtyData.dart';

import '../widget/Methods.dart';

class AllExpense extends StatefulWidget {
  const AllExpense({super.key});

  @override
  State<AllExpense> createState() => _AllExpenseState();
}

class _AllExpenseState extends State<AllExpense> {
  AppDataController appCtrl = Get.find<AppDataController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar('Harcamalar'),
      body: GetX<AppDataController>(builder: (AppDataController controller) {
        return appCtrl.expens.isEmpty ?  const EmptyData(title: 'Henüz Hiç Kayıt Yok!') : const MyListView();
      },)
    );
  }
}
