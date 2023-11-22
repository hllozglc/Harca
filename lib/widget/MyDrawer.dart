import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Halil Özgüleç'),
            accountEmail: const Text('10.000TL'),
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
            onTap: () => null,
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.listCheck,color: MyColor.iconColor,),
            title: const Text('Tüm Harcamalar'),
            onTap: () => null,
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.solidBell,color: MyColor.iconColor,),
            title: const Text('Uyarı Ekle'),
            onTap: () => null,
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.filter,color: MyColor.iconColor,),
            title: Text('Harcama Filtrele'),
          ),
          Divider(),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.gear,color: MyColor.iconColor,),
            title: const Text('Ayarlar'),
            onTap: () => null,
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.trash,color: Colors.red,),
            title: const Text('Verileri Sıfırla'),
            onTap: () => null,
          ),
          Divider(),
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