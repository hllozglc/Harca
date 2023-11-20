import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harca/constants/style.dart';
import '../widget/mainMenuCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Ana Sayfa",style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){},icon:const Icon(Icons.menu,color: Colors.black,),),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings,color: Colors.black,))],
      ),
      body:  Column(
        children: [
          const MainMenuCard(icon:Icons.notifications_outlined,title:'Uyarı Ekle',text:'Belli bir gelire veya gidere ulaştığınızda bildirim alın',color: MyColor.cardColor1),
          const MainMenuCard(icon: Icons.filter_alt_outlined, title: 'Harcama Filitrele', text: 'En az harcanan kategori,tarih aralığı,harcanan en yüksek miktar vb.',color: MyColor.cardColor2),
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
                ),)
              ],
            ),
          ),
          Expanded(child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
               return const ListTile(
                 title: Text('title'),
                 subtitle: Text('subtitle'),
                 leading: Icon(Icons.exposure,size: 40,),
                 trailing: Text('999TL'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

