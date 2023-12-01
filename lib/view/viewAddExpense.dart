import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/providers/bottomNavBarProvider.dart';
import 'package:harca/core/providers/dropDownButtonProvider.dart';
import 'package:harca/core/providers/expenseProvider.dart';
import 'package:harca/library/InputValidators.dart';
import 'package:harca/models/expenseModel.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/MyDrawer.dart';

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
  'Finansal Harcamalar'];
const List<String> gelirDropItems = <String>[
  'Maaş Ve Ücretler',
  'Yatırım Gelirleri',
  'Kira Geliri',
  'İşletme Geliri',
  'Hediye ve Bağışlar',
  'Diğer Gelir Kaynakları'];

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String giderDropdownValue = giderDropItems.first;
  String gelirDropdownValue = gelirDropItems.first;
  final _formKey = GlobalKey<FormState>();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController h1 = TextEditingController();
  TextEditingController h2 = TextEditingController();
  TextEditingController h3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 700),
      length: 2,
      initialIndex: 0,
      child: Builder(builder: (BuildContext context) {
        final tab = Provider<int>((ref) => DefaultTabController.of(context).index);
        return Scaffold(
            drawer: MyDrawer(),
            backgroundColor: Colors.white,
            appBar: MyAppBarPage('Ekle'),
            body: Form(
              key: _formKey,
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: MytextField(label: 'Harcama Adı', controller: t1,validator: InputValidators.textRequired)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: MytextField(label: 'Fiyat',keyboard: TextInputType.number, controller: t3,validator: InputValidators.vergiNoRequired)),
                      Consumer(builder: (context, ref, child) {
                        var giderList = ref.watch(giderDropdownProvider);
                       return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: InputDecorator(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(7),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Icon(Icons.arrow_drop_down),
                                style: MyStyle.titleStyle().copyWith(fontSize: 16,color: MyColor.textColor.withOpacity(0.8)),
                                value: giderDropdownValue,
                                items: giderDropItems.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    giderDropdownValue=value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        );
                      },)
                    ]
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: MytextField(label: 'Gelir Adı', controller: h1,validator: InputValidators.textRequired)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: MytextField(label: 'Fiyat',keyboard: TextInputType.number, controller: h3,validator: InputValidators.vergiNoRequired)),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: InputDecorator(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(7),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Icon(Icons.arrow_forward_ios),
                                style: MyStyle.titleStyle().copyWith(fontSize: 16,color: MyColor.textColor.withOpacity(0.8)),
                                value: gelirDropdownValue,
                                items: gelirDropItems.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    gelirDropdownValue=value!;
                                  });
                                },
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButton: Consumer(builder: (context, ref, child) =>
              FloatingActionButton(
                backgroundColor: MyColor.iconColor,
                child: const FaIcon(FontAwesomeIcons.plus),
                onPressed: () {
                  if (ref.watch(tab) == 0) {
                    if(_formKey.currentState!.validate()){
                      print('Gider Index: ${DefaultTabController.of(context).index}');
                      ref.read(expenseNotifierProvider.notifier).addExpense(ExpenseModel(title: t1.text, subtitle: giderDropdownValue, price: double.parse(t3.text)*-1,icon: const FaIcon(FontAwesomeIcons.circleDown,color: Colors.red,size: 35)));
                      ref.watch(bottomNavBarNotifierProvider.notifier).homeRoot();
                      const snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Başarıyla Eklendi'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                  else if (ref.watch(tab) == 1) {
                    if(_formKey.currentState!.validate()){
                      print('Gelir Index: ${DefaultTabController.of(context).index}');
                      ref.read(expenseNotifierProvider.notifier).addExpense(ExpenseModel(title: h1.text, subtitle: gelirDropdownValue, price: double.parse(h3.text)*1,icon: const FaIcon(FontAwesomeIcons.circleUp,color: Colors.green,size: 35)));
                      ref.watch(bottomNavBarNotifierProvider.notifier).homeRoot();
                      const snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Başarıyla Eklendi'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
