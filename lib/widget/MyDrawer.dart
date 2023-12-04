import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/main.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  AppDataController appCtrl = Get.find<AppDataController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Halil Özgüleç'),
            accountEmail: Text('${appCtrl.totalExpense()??"0"} TL'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('assets/images/user_profile.png', fit: BoxFit.cover, width: 90, height: 90,),),),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/bg-pattern-old.jpg')),),),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.solidBell,color: MyColor.iconColor,),
            title: const Text('Uyarı Ekle'),
            onTap: () => Get.toNamed(addAlert),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.filter,color: MyColor.iconColor,),
            title: const Text('Harcama Filtrele'),
            onTap: () => Get.toNamed(expenseFilter),
          ),
          const Divider(),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.creditCard,color: MyColor.iconColor,),
            title: const Text('Kart Ekle'),
            onTap: () => Get.toNamed(addCard),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.mendeley,color: MyColor.iconColor,),
            title: const Text('Kategori Ekle'),
            onTap: () => Get.toNamed(addCategory),
          ),
          const Divider(),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.gear,color: MyColor.iconColor,),
            title: const Text('Ayarlar'),
            onTap: () => null,
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.trash,color: Colors.red,),
            title: const Text('Verileri Sıfırla'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                 return AlertDialog(
                    title: const Text('Dikkat'),
                    content: const Text('Tüm verileri silmek istediğinize eminmisiniz'),
                    actions: [
                      ElevatedButton(
                        child: const Text('Evet'),
                        onPressed: () {
                          if(appCtrl.expens.isEmpty){
                            Get.back();
                            Get.snackbar('Uyarı', 'Halihazırda veri listenizde hiç veri yok',backgroundColor: Colors.orange,snackPosition:SnackPosition.BOTTOM);
                          }else{
                            appCtrl.allRemoveExpense();
                            Get.back();
                            Get.snackbar('Başarılı', 'Tüm Veriler Silindi',backgroundColor: Colors.green);
                          }
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Hayır'),
                        onPressed: () {Get.back();},
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Çıkış'),
            leading: const FaIcon(FontAwesomeIcons.rightFromBracket,color: MyColor.iconColor,),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}