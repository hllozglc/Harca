import 'package:get/get.dart';
import 'package:harca/models/cardModel.dart';

import '../../models/alertModel.dart';
import '../../models/expenseModel.dart';

class AppDataController extends GetxController{
  var selectedCard ="".obs;
  List<CardModel> cardList = <CardModel>[].obs;
  void addCard(CardModel cardModel){
    cardList.add(cardModel);
  }
  void deleteCard(CardModel cardModel){
    cardList.remove(cardModel);
  }
  // uyarılar
 List<AlertModel> alertList =<AlertModel>[].obs;
 void addALert(AlertModel alertModel){
   alertList.add(alertModel);
 }
 void removeAlert(AlertModel alertModel){
   alertList.remove(alertModel);
 }
  //kategori
  var selectedItem = "".obs;
  void upDateSelectedItem(value){
    selectedItem.value = value;
  }
  void addCategory(String category){
    categories.add(category);
  }
  List<String> categories = <String>[
    'Temel Giderler',
    'Yiyecek ve İçecek',
    'Ulaşım',
    'Sağlık',
    'Eğlence ve Aktiviteler',
    'Kişisel Bakım',
    'Giyim ve Ayakkabı',
    'Eğitim ve Gelişim',
    'Ev Giderleri',
    'Finansal Harcamalar',
    'Maaş Ve Ücretler',
    'Yatırım Gelirleri',
    'Kira Geliri',
    'İşletme Geliri',
    'Hediye ve Bağışlar',
    'Diğer Gelir Kaynakları'
  ].obs;

  //Gelir Gider
  RxList<ExpenseModel> expens = <ExpenseModel>[].obs;
  void addExpens(ExpenseModel expense){
    expens.add(expense);
  }
  void deleteExpens(ExpenseModel expense){
    expens.remove(expense);
  }
  double? totalExpense (){
    for(int i=0;i<expens.length;i++){
      double tutar = 0;
      for(int i = 0 ; i<expens.length; i++){
        tutar += expens[i].price!;
      }
      return tutar;
    }
  }
  void allRemoveExpense(){
    expens.clear();
  }
}