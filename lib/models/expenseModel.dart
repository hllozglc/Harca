import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../library/DatabaseHelper.dart';

class ExpenseModel {
  int? id;
  String? title;
  String? subtitle;
  double? price;
  FaIcon? icon;

  ExpenseModel({this.title, this.subtitle, this.price, this.icon});
  ExpenseModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    subtitle = map['subtitle'];
    price = map['price'];
    icon = map['icon'];
  }
  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnSubtitle: subtitle,
      DatabaseHelper.columnPrice: price,
      DatabaseHelper.columnIcon: icon,
    };
  }
}
