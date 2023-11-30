import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view/viewAddExpense.dart';
import '../../view/viewAllExpense.dart';
import '../../view/viewHomePage.dart';


final bottomNavBarNotifierProvider = StateNotifierProvider<BottomNavbarController,int>((ref) {
  return BottomNavbarController();
});


class BottomNavbarController extends StateNotifier<int>{
  BottomNavbarController() : super(0);

  Widget getPages() {
    switch (state) {
      case 0:return const HomePage();break;
      case 1:return const AddExpense();break;
      case 2:return const AllExpense();break;
      default:
        return const HomePage();
    }
  }
  void onItemTapped(int index) {
    state = index;
    print(state);
  }
  void allExpenseRoot(){
    state = 2;
  }
  void homeRoot(){
    state = 0;
  }

}
