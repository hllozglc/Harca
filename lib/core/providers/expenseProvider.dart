import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harca/models/expenseModel.dart';




final expenseNotifierProvider = StateNotifierProvider<ExpenseController, List<ExpenseModel>>((ref) {
  return ExpenseController();
});

class ExpenseController extends StateNotifier<List<ExpenseModel>>{
  ExpenseController() : super([]);

  void addExpense(ExpenseModel expense){
    state = [...state,expense];
  }
  void allClear(){
    state = [];
  }
  double giderTotal (){
    double tutar = 0;
    for(int i = 0 ; i<state.length; i++){
     tutar += state[i].price;
    }
    return tutar;
  }
  void deleteExpense(int expense){
    var newState =  state.removeAt(expense);
    state = [newState];
  }
 }