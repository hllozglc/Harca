import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/providers/bottomNavBarProvider.dart';
import 'package:harca/core/providers/expenseProvider.dart';
import 'package:harca/view/viewAddAlert.dart';

class MyDrawer extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Halil Özgüleç'),
            accountEmail: Text('${ref.watch(expenseNotifierProvider.notifier).giderTotal().toString()} TL'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.network('https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png', fit: BoxFit.cover, width: 90, height: 90,),),),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),),),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.plus,color: MyColor.iconColor,),
            title: const Text('Harcama Ekle'),
            onTap: () => ref.watch(bottomNavBarNotifierProvider.notifier).addRoot(),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.listCheck,color: MyColor.iconColor,),
            title: const Text('Tüm Harcamalar'),
            onTap: () => ref.watch(bottomNavBarNotifierProvider.notifier).allExpenseRoot(),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.solidBell,color: MyColor.iconColor,),
            title: const Text('Uyarı Ekle'),
            onTap: () => Navigator.pushNamed(context, '/addAlert'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.filter,color: MyColor.iconColor,),
            title: Text('Harcama Filtrele'),
            onTap: () => Navigator.pushNamed(context, '/expenseFilter'),
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
                          ref.watch(expenseNotifierProvider.notifier).allClear();
                          Navigator.pop(context);
                          const snackBar = SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Tüm verileri Silindi'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Hayır'),
                        onPressed: () {Navigator.pop(context);},
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