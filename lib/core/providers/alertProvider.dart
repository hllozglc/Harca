import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harca/models/alertModel.dart';

final alertNotifierProvider = StateNotifierProvider<AlertController, List<AlertModel>>((ref) {
  return AlertController();
});


class AlertController extends StateNotifier<List<AlertModel>>{
  AlertController() : super([]);

  void addAlert(AlertModel model){
    state = [...state,model];
  }
  void deleteExpense(int expense){
    var newState =  state.removeAt(expense);
    state = [newState];
  }
}