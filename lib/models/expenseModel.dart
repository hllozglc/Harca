import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ExpenseModel {
  final String title;
  final String subtitle;
  final double price;
  final FaIcon icon;

  ExpenseModel({required this.title, required this.subtitle, required this.price,required this.icon});
}