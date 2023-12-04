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

const List<String> giderDropItems = <String>[
  'Temel Giderler',
  'Yiyecek ve İçecek',
  'Ulaşım',
  'Sağlık',
  'Eğlence ve Aktiviteler',
  'Kişisel Bakım',
  'Giyim ve Ayakkabı',
  'Eğitim ve Gelişim',
  'Ev Giderleri',
  'Finansal Harcamalar',
  'Maaş Ve Ücretler',
  'Yatırım Gelirleri',
  'Kira Geliri',
  'İşletme Geliri',
  'Hediye ve Bağışlar',
  'Diğer Gelir Kaynakları'
];


class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  AppDataController appCtrl = Get.find<AppDataController>();
  String giderDropdownValue = giderDropItems.first;
  final _formKey = GlobalKey<FormState>();
  TextEditingController adi = TextEditingController();
  TextEditingController tutar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar('Ekle'),
      body: Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(height: 10.h),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: MytextField(
                  label: 'Başlık',
                  controller: adi,
                  validator: InputValidators.textRequired)),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: MytextField(
                  label: 'Fiyat',
                  keyboard: TextInputType.number,
                  controller: tutar,
                  validator: InputValidators.vergiNoRequired)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InputDecorator(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: DropdownButtonHideUnderline(
                  child: Obx(() => DropdownButton<String>(
                    hint: const Text('Kategori Seçiniz...'),
                    icon: const Icon(Icons.arrow_drop_down),
                    style: MyStyle.titleStyle().copyWith(fontSize: 16, color: MyColor.textColor.withOpacity(0.8)),
                    value: appCtrl.selectedItem.value==""?null:appCtrl.selectedItem.value,
                    items: appCtrl.categories.map<DropdownMenuItem<String>>((String value) {return DropdownMenuItem<String>(value: value, child: Text(value),);}).toList(),
                    onChanged: (newValue) {
                      appCtrl.upDateSelectedItem(newValue.toString());
                    },
                  ),)
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            _buildButton(title: 'Gider',color: Colors.red,onTap: () {
              if(_formKey.currentState!.validate()) {
                appCtrl.addExpens(ExpenseModel(title: adi.text, subtitle: appCtrl.selectedItem.value, price: double.parse(tutar.text)*-1,icon: const FaIcon(FontAwesomeIcons.circleDown,color: Colors.red,size: 35)));
                Get.snackbar('Gider', 'İşleminiz başarılı bir şekilde kaydedildi',icon: const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: FaIcon(FontAwesomeIcons.circleDown,color: Colors.red,size: 35),));
                adi.clear();
                tutar.clear();
                FocusManager.instance.primaryFocus!.unfocus();
              }
            }),
            _buildButton(title: 'Gelir',color: Colors.green,onTap: () {
              if(_formKey.currentState!.validate()) {
                appCtrl.addExpens(ExpenseModel(title: adi.text, subtitle: appCtrl.selectedItem.value, price: double.parse(tutar.text)*1,icon: const FaIcon(FontAwesomeIcons.circleUp,color: Colors.green,size: 35)));
                Get.snackbar('Gelir', 'İşleminiz başarılı bir şekilde kaydedildi',icon: const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: FaIcon(FontAwesomeIcons.circleUp,color: Colors.green,size: 35),));
                adi.clear();
                tutar.clear();
                FocusManager.instance.primaryFocus!.unfocus();
              }
            }),
          ]),
        ]),
      ),
    );
  }

  Widget _buildButton({String? title,Color? color,void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 100.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(FontAwesomeIcons.circleDown,color: Colors.white,),
              Center(child: Text(title??"-",style: MyStyle.textStyle().copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
            ],
          )
      ),
    );
  }
}
