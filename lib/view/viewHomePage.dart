import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/providers/bottomNavBarProvider.dart';
import 'package:harca/core/providers/expenseProvider.dart';
import 'package:harca/widget/MyDrawer.dart';
import 'package:harca/widget/emtyData.dart';
import '../widget/Methods.dart';
import '../widget/MyListView.dart';
import '../widget/mainMenuCard.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: MyAppBar('Ana Sayfa'),
      body:  Column(
        children: [
          MainMenuCard(icon: FontAwesomeIcons.solidBell,title:'Uyarı Ekle',text:'Belli bir gelire veya gidere ulaştığınızda bildirim alın',color: MyColor.cardColor1,onTap: () => Navigator.pushNamed(context, '/addAlert'),),
          MainMenuCard(icon: FontAwesomeIcons.filter, title: 'Harcama Filtrele', text: 'En az harcanan kategori,tarih aralığı,harcanan en yüksek miktar vb.',color: MyColor.cardColor2,onTap: () => Navigator.pushNamed(context, '/expenseFilter'),),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Son Hareketler',style: MyStyle.textStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500),),
                TextButton(onPressed: (){ref.watch(bottomNavBarNotifierProvider.notifier).allExpenseRoot();}, child: Text('Tümünü gör',style: MyStyle.textStyle().copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ref.watch(expenseNotifierProvider).isEmpty ? const EmptyData() :const MyListView()),
        ],
      ),
    );
  }
}


