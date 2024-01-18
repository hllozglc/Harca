import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/library/InputValidators.dart';
import 'package:harca/models/cardModel.dart';
import 'package:harca/models/expenseModel.dart';
import 'package:harca/widget/Methods.dart';

import '../widget/MyTextField.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  AppDataController appCtrl = Get.find<AppDataController>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController adi = TextEditingController();
  TextEditingController tutar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: MyAppBar(title: 'Gider Ekle', bgColor: MyColor.primaryColor, titleColor: Colors.white),
      body: Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: MytextField(label: 'Başlık', controller: adi, validator: InputValidators.textRequired)),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: MytextField(label: 'Fiyat', keyboard: TextInputType.number, controller: tutar, validator: InputValidators.vergiNoRequired)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: Obx(
                    () => DropdownButton<String>(
                      hint: const Text('Kategori Seçiniz...'),
                      icon: const Icon(Icons.arrow_drop_down),
                      style: MyStyle.titleStyle().copyWith(fontSize: 16, color: MyColor.textColor.withOpacity(0.8)),
                      value: appCtrl.selectedItem.value == "" ? null : appCtrl.selectedItem.value,
                      items: appCtrl.categories.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        appCtrl.upDateSelectedItem(newValue.toString());
                      },
                    ),
                  )),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: Obx(
                    () => DropdownButton<String>(
                      hint: const Text('Kart Seçiniz...'),
                      icon: const Icon(Icons.arrow_drop_down),
                      style: MyStyle.titleStyle().copyWith(fontSize: 16, color: MyColor.textColor.withOpacity(0.8)),
                      value: appCtrl.selectedCard.value == "" ? null : appCtrl.selectedCard.value,
                      items: appCtrl.cardList.map<DropdownMenuItem<String>>((CardModel value) {
                        return DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        appCtrl.upDateSelectedCard(newValue.toString());
                      },
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: MyColor.iconColor,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            appCtrl.addExpens(ExpenseModel(
              title: adi.text,
              subtitle: appCtrl.selectedItem.value,
              price: double.parse(tutar.text) * -1,
              icon: const FaIcon(FontAwesomeIcons.circleDown, color: Colors.red, size: 35),
              date: DateTime.now(),
            ));
            Get.snackbar('Gider', 'İşleminiz başarılı bir şekilde kaydedildi',
                icon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: FaIcon(FontAwesomeIcons.circleDown, color: Colors.red, size: 35),
                ));
            adi.clear();
            tutar.clear();
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: const FaIcon(FontAwesomeIcons.plus, color: Colors.white),
      ),
    );
  }

  Widget _buildButton({String? title, Color? color, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 100.w,
          height: 50.h,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                FontAwesomeIcons.circleDown,
                color: Colors.white,
              ),
              Center(
                child: Text(
                  title ?? "-",
                  style: MyStyle.textStyle().copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          )),
    );
  }
}
