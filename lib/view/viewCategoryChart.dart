import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/MyListView.dart';
import 'package:harca/widget/emtyData.dart';

import '../models/expenseModel.dart';

class CategoryChart extends StatefulWidget {
  const CategoryChart({super.key});

  @override
  State<CategoryChart> createState() => _CategoryChartState();
}

class _CategoryChartState extends State<CategoryChart> {
  AppDataController appCtrl = Get.find<AppDataController>();
  double getCategoryPrice(String category){
    List<ExpenseModel> expenses = appCtrl.expens.where((p0) => p0.subtitle == category).toList();
    double total = expenses.fold(0, (previousValue, element) => previousValue + element.price!);
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(title: 'Raporlarma ve Grafik'),
        body: appCtrl.totalExpense() == 0 ? const EmptyData(title: 'Grafikler için Bir Kaç Veri Gerekiyor') : Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 90,
                        sections: [
                          _chartItem('Temel Giderler',Colors.red),
                          _chartItem('Yiyecek ve İçecek',Colors.green),
                          _chartItem('Ulaşım',Colors.blue),
                          _chartItem('Sağlık',Colors.teal),
                          _chartItem('Eğlence ve Aktiviteler',Colors.purple),
                          _chartItem('Kişisel Bakım',Colors.yellow),
                          _chartItem('Giyim ve Ayakkabı',Colors.tealAccent),
                          _chartItem('Eğitim ve Gelişim',Colors.grey),
                        ]),
                  ),
                  Text(appCtrl.totalExpense().toString()),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: appCtrl.categories.length,
                itemBuilder: (context, index) {
                  var model = appCtrl.categories[index];
                  return ListTile(
                    title:Text(model),
                    trailing: Text(getCategoryPrice(model).toString()),
                  );
                },),
            ),
          ],
        )
    );
  }

  PieChartSectionData _chartItem(String category,Color color) {
    return PieChartSectionData(
      titleStyle: MyStyle.textStyle().copyWith(fontWeight: FontWeight.bold),
      value: getCategoryPrice(category),
      title: '$category\n${getCategoryPrice(category)}',
      color: color,
    );
  }
}
