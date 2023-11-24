import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harca/models/expenseModel.dart';



final myMoney = Provider<double>((ref) => 0);
final expenseNotifierProvider = StateNotifierProvider<ExpenseController, List<ExpenseModel>>((ref) {
  return ExpenseController();
});
class ExpenseController extends StateNotifier<List<ExpenseModel>>{
  ExpenseController() : super([]);

  void addExpense(ExpenseModel expense){
      state = [...state,expense];
  }
 }