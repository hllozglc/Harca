import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final giderDropdownProvider = StateProvider<List<String>>((ref) => [
  'Temel Giderler',
  'Yiyecek ve İçecek',
  'Ulaşım',
  'Sağlık',
  'Eğlence ve Aktiviteler',
  'Kişisel Bakım',
  'Giyim ve Ayakkabı',
  'Eğitim ve Gelişim',
  'Ev Giderleri',
  'Finansal Harcamalar'
]);
final gelirDropdownProvider = StateProvider<List<String>>((ref) => [
  'Maaş Ve Ücretler',
  'Yatırım Gelirleri',
  'Kira Geliri',
  'İşletme Geliri',
  'Hediye ve Bağışlar',
  'Diğer Gelir Kaynakları'
]);

