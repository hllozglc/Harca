import 'package:get/get.dart';
import 'package:harca/models/expenseModel.dart';

import '../../library/DatabaseHelper.dart';

class DatabaseControllerr extends GetxController{
  List<ExpenseModel> expensDatabase = <ExpenseModel>[].obs;
  final dbHelper = DatabaseHelper.instance;
  void insert(String title, String subtitle,int price,int icon) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnTitle : title,
      DatabaseHelper.columnSubtitle : subtitle,
      DatabaseHelper.columnPrice : price,
      DatabaseHelper.columnIcon : icon,
    };
    ExpenseModel expenseModel = ExpenseModel.fromMap(row);
    final id = await dbHelper.insert(expenseModel);
    print('yeni eleman eklendi id : $id');
  }

  Future<List<ExpenseModel>> queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    return allRows.map((e) => ExpenseModel.fromMap(e)).toList();
  }

  void delete(int id) async {
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s) : rows $id');
  }
  Future<int> totalExpense() async {
    var totalPrice = await dbHelper.getTotalPrice();
    print('Toplam Tutar: $totalPrice');
    return totalPrice ?? 0;
  }
  Future<List<ExpenseModel>> filteredExpense (String subtitle)async{
    var expenses = await dbHelper.queryBySubtitle(subtitle);
    return expenses.map((e) => ExpenseModel.fromMap(e)).toList();
  }
}