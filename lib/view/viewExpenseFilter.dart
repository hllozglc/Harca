import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/models/expenseModel.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/emtyData.dart';

import '../constants/style.dart';

class ExpenseFilter extends StatefulWidget {
  const ExpenseFilter({super.key});

  @override
  State<ExpenseFilter> createState() => _ExpenseFilterState();
}

class _ExpenseFilterState extends State<ExpenseFilter> {
  AppDataController appCtrl = Get.find<AppDataController>();
  @override
  Widget build(BuildContext context) {
    List<ExpenseModel> filteredList = appCtrl.expens.where((expense) => expense.subtitle == appCtrl.selectedItem.value).toList();
    double total = filteredList.fold(0, (previous, current) => previous + current.price!);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar('Filtrele'),
      body: GetX<AppDataController>(
        builder: (AppDataController controller) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: InputDecorator(decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(7),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text('Kategori Seçiniz...'),
                    icon: const Icon(Icons.arrow_drop_down),
                    style: MyStyle.titleStyle().copyWith(fontSize: 16, color: MyColor.textColor.withOpacity(0.8)),
                    value: appCtrl.selectedItem.value == "" ? null : appCtrl.selectedItem.value,
                    items: appCtrl.categories.map<DropdownMenuItem<String>>((String value) {return DropdownMenuItem<String>(value: value, child: Text(value),);}).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        appCtrl.upDateSelectedItem(newValue.toString());
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(child: filteredList.isEmpty ? const EmptyData(title: 'Bu Kategoride Kayıt Yok!',) : ListView.builder(
              itemCount: filteredList.length,
              itemBuilder:(context, index) {
                var model = filteredList[index];
                return ListTile(
                  title: Text(model.title!),
                  subtitle: Text(model.subtitle!),
                  leading: model.icon,
                  trailing: Text('${model.price.toString()} TL'),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30.0),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Toplam:"),
                  Text("${total.toString()} TL"),
                ],
              ),
            ),
          ],
        );
      },)
    );
  }
}
