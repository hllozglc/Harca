import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harca/widget/MyDrawer.dart';
import 'package:harca/widget/MyListView.dart';

import '../core/providers/expenseProvider.dart';
import '../widget/Methods.dart';
import '../widget/emtyData.dart';

class AllExpense extends ConsumerWidget {
  const AllExpense({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: MyAppBar('Harcamalar'),
      body:ref.watch(expenseNotifierProvider).isEmpty ? const EmptyData() :const MyListView(),
    );
  }
}
