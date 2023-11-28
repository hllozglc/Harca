import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dropDownButtonNotifierProvider = StateNotifierProvider<DropDownButtonController,List<DropdownMenuItem<String>>>((ref) {
  return DropDownButtonController();
});

class DropDownButtonController extends StateNotifier<List<DropdownMenuItem<String>>> {
  DropDownButtonController() : super([
    const DropdownMenuItem(value: 'Temel İhtiyaç',child: Text('Temel ihtiyaç'),),
    const DropdownMenuItem(value: 'Market',child: Text('Market'),),
    const DropdownMenuItem(value: 'Fatura',child: Text('Fatura'),),
    const DropdownMenuItem(value: 'Eğlence',child: Text('Eğlence'),),
    const DropdownMenuItem(value: 'Diğer',child: Text('Diğer'),),
  ]);


  void onChanged(String? val){
    print('$val Seçtiniz');
    for(int i = 0; i < state.length;i++){
      if(state[i].value==val){
          print(state[i].value);
      }
    }
  }
}


