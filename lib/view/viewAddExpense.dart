import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/MyDrawer.dart';

import '../widget/MyTextField.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: Colors.white,
        appBar: MyAppBarPage('Ekle'),
          body: TabBarView(
          children: [
            Column(
              children: [
                SizedBox(height: 10.h),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: const MytextField(label: 'Harcama Adı',),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: const MytextField(label: 'Kategori',),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: const MytextField(label: 'Fiyat',),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(height: 10.h),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: const MytextField(label: 'Gelier Adı',),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: const MytextField(label: 'Kategori',),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: const MytextField(label: 'Fiyat',),
                )
              ],
            ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColor.iconColor,
          child: const FaIcon(FontAwesomeIcons.plus),
          onPressed: () {
          },
        ),
      ),
    );
  }
}


