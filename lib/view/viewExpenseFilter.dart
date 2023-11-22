import 'package:flutter/material.dart';
import 'package:harca/widget/Methods.dart';

class ExpenseFilter extends StatefulWidget {
  const ExpenseFilter({super.key});

  @override
  State<ExpenseFilter> createState() => _ExpenseFilterState();
}

class _ExpenseFilterState extends State<ExpenseFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Filtrele'),
    );
  }
}
