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
import 'package:harca/widget/dropDownButton.dart';

import '../widget/MyTextField.dart';

class AddExpense extends ConsumerWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController t1 = TextEditingController();
    TextEditingController t2 = TextEditingController();
    TextEditingController t3 = TextEditingController();
    TextEditingController h1 = TextEditingController();
    TextEditingController h2 = TextEditingController();
    TextEditingController h3 = TextEditingController();
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 700),
      length: 2,
      initialIndex: 0,
      child: Builder(builder: (BuildContext context) {
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
                        child: MytextField(label: 'Kategori', controller: t2,validator: InputValidators.textRequired)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: MytextField(label: 'Fiyat', controller: t3,validator: InputValidators.textRequired)),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: MytextField(label: 'Gelir Adı', controller: h1,validator: InputValidators.textRequired)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: DropdownButton<String>(
                          value: ref.watch(dropDownButtonNotifierProvider).first.value,
                          items: ref.watch(dropDownButtonNotifierProvider),
                          onChanged: (value) => ref.read(dropDownButtonNotifierProvider.notifier).onChanged(value),
                        )),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: MytextField(label: 'Fiyat', controller: h3,validator: InputValidators.textRequired))
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: MyColor.iconColor,
              child: const FaIcon(FontAwesomeIcons.plus),
              onPressed: () {
                if (DefaultTabController.of(context).index == 0) {
                  if(_formKey.currentState!.validate()){
                    print('Gider Index: ${DefaultTabController.of(context).index}');
                    ref.read(expenseNotifierProvider.notifier).addExpense(ExpenseModel(title: t1.text, subtitle: t2.text, price: double.parse(t3.text),icon: const FaIcon(FontAwesomeIcons.circleDown,color: Colors.red,size: 35)));
                    ref.watch(bottomNavBarNotifierProvider.notifier).homeRoot();
                    const snackBar = SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Başarıyla Eklendi'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
                else if (DefaultTabController.of(context).index == 1) {
                  if(_formKey.currentState!.validate()){
                    print('Gelir Index: ${DefaultTabController.of(context).index}');
                    ref.read(expenseNotifierProvider.notifier).addExpense(ExpenseModel(title: h1.text, subtitle: ref.watch(dropDownButtonNotifierProvider)[2].value!, price: double.parse(h3.text),icon: const FaIcon(FontAwesomeIcons.circleUp,color: Colors.green,size: 35)));
                    ref.watch(bottomNavBarNotifierProvider.notifier).homeRoot();
                    const snackBar = SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Başarıyla Eklendi'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
            ),
          );
        },
      ),
    );
  }
}
