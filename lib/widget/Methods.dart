import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';

AppBar MyAppBar(String title) {
  return AppBar(
    iconTheme: const IconThemeData(color: MyColor.iconColor),
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text(title,style: const TextStyle(color: MyColor.textColor),),
    //leading:Builder(builder: (context) {return IconButton(onPressed: (){},icon:const Icon(Icons.menu,color: MyColor.iconColor,),);},),
    actions: [IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.gear),color: MyColor.iconColor)],
  );
}

AppBar MyAppBarPage(String title) {
  return AppBar(
    iconTheme: const IconThemeData(color: MyColor.iconColor),
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text(title,style: const TextStyle(color: MyColor.textColor),),
    //leading: IconButton(onPressed: (){},icon:const Icon(Icons.menu,color: MyColor.iconColor,),),
    actions: [IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.gear),color: MyColor.iconColor)],
    bottom: const TabBar(
      labelColor: MyColor.textColor,
      tabs: [
      Tab(
        icon: FaIcon(FontAwesomeIcons.minus,color: Colors.red,),
        text: "Harca",
      ),
      Tab(
        icon: FaIcon(FontAwesomeIcons.plus,color: Colors.green,),
        text: "Gelir",
      ),
    ],),
  );
}
