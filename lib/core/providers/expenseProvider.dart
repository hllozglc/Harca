import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harca/models/expenseModel.dart';

final expenseNotifierProvider = StateNotifierProvider<ExpenseController, List<ExpenseModel>>((ref) {
  return ExpenseController();
});


class ExpenseController extends StateNotifier<List<ExpenseModel>>{
  ExpenseController() : super([ExpenseModel(title: 'Örnek Harcama', subtitle: 'Temel İhtiyaç', price: 120)]);

  void addExpense(ExpenseModel expense){
      state = [...state,expense];
  }

 }