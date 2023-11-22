import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/widget/MyDrawer.dart';
import '../widget/Methods.dart';
import '../widget/MyListView.dart';
import '../widget/mainMenuCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: MyAppBar('Ana Sayfa'),
      body:  Column(
        children: [
          MainMenuCard(icon: FontAwesomeIcons.solidBell,title:'Uyarı Ekle',text:'Belli bir gelire veya gidere ulaştığınızda bildirim alın',color: MyColor.cardColor1,onTap: () => Get.toNamed('/addAlert'),),
          MainMenuCard(icon: FontAwesomeIcons.filter, title: 'Harcama Filtrele', text: 'En az harcanan kategori,tarih aralığı,harcanan en yüksek miktar vb.',color: MyColor.cardColor2,onTap: () => Get.toNamed('/expenseFilter'),),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Son Hareketler',style: MyStyle.textStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500),),
                TextButton(onPressed: (){}, child: Text('Tümünü gör',style: MyStyle.textStyle().copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: MyListView()),
        ],
      ),
    );
  }
}


