import 'package:flutter/material.dart';
import 'package:harca/widget/MyDrawer.dart';
import 'package:harca/widget/MyListView.dart';

import '../widget/Methods.dart';

class AllExpense extends StatefulWidget {
  const AllExpense({super.key});

  @override
  State<AllExpense> createState() => _AllExpenseState();
}

class _AllExpenseState extends State<AllExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: MyAppBar('Harcamalar'),
      body: const MyListView(),
    );
  }
}
