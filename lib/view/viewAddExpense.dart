import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/providers/expenseProvider.dart';
import 'package:harca/models/expenseModel.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/MyDrawer.dart';

import '../widget/MyTextField.dart';

class AddExpense extends ConsumerWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            drawer: MyDrawer(),
            backgroundColor: Colors.white,
            appBar: MyAppBarPage('Ekle'),
            body: TabBarView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 10.h),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: MytextField(
                        label: 'Harcama Adı',
                        controller: t1,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: MytextField(
                        label: 'Kategori',
                        controller: t2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: MytextField(label: 'Fiyat', controller: t3),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 10.h),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: MytextField(label: 'Gelir Adı', controller: h1),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: MytextField(label: 'Kategori', controller: h2),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: MytextField(label: 'Fiyat', controller: h3),
                    )
                  ],
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: MyColor.iconColor,
              child: const FaIcon(FontAwesomeIcons.plus),
              onPressed: () {
                if (DefaultTabController.of(context).index == 0) {
                  print('Gider Index: ${DefaultTabController.of(context).index}');
                  ref.read(expenseNotifierProvider.notifier).addExpense(ExpenseModel(title: t1.text, subtitle: t2.text, price: double.parse(t3.text),icon: const FaIcon(FontAwesomeIcons.circleDown,color: Colors.red,size: 35)));
                  Navigator.pushNamed(context, '/');
                } else if (DefaultTabController.of(context).index == 1) {
                  print('Gelir Index: ${DefaultTabController.of(context).index}');
                  ref.read(expenseNotifierProvider.notifier).addExpense(ExpenseModel(title: h1.text, subtitle: h2.text, price: double.parse(h3.text),icon: const FaIcon(FontAwesomeIcons.circleUp,color: Colors.green,size: 35)));
                  Navigator.pushNamed(context, '/');
                }
              },
            ),
          );
        },
      ),
    );
  }
}
