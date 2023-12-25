import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/main.dart';
import 'package:harca/widget/Methods.dart';

class ReportingList extends StatelessWidget {
  const ReportingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: MyAppBar(title: 'Raporlar'),
      body: Column(
        children: [
          InkWell(
            onTap: () {Get.toNamed(categoryChart);},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: MyColor.cardColor2,
                leading: const FaIcon(FontAwesomeIcons.chartPie,color: MyColor.iconColor,),
                title: const Text('Kategori Grafiği'),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Get.toNamed(expenseChart),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: MyColor.cardColor2,
                leading: const FaIcon(FontAwesomeIcons.chartLine,color: MyColor.iconColor,),
                title: const Text('Harcama Grafiği'),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
