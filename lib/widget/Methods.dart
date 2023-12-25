import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';

AppBar MyAppBar({Color? titleColor,Color? bgColor,String? title,void Function()? onTap,IconData? icon}) {
  return AppBar(
    centerTitle: true  ,
    iconTheme: const IconThemeData(color: MyColor.iconColor),
    elevation: 0,
    backgroundColor: bgColor?? MyColor.bgColor,
    title: Text(title??"Boş",style: TextStyle(color:titleColor ?? MyColor.textColor),),
    //leading:Builder(builder: (context) {return IconButton(onPressed: (){},icon:const Icon(Icons.menu,color: MyColor.iconColor,),);},),
    actions: [IconButton(onPressed: onTap, icon: FaIcon(icon,color: MyColor.iconColor,),color: MyColor.iconColor)],
  );
}

AppBar MyAppBarPage(String title) {
  return AppBar(
    centerTitle: true,
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
        icon: FaIcon(FontAwesomeIcons.circleDown,color: Colors.red,),
        text: "Gider",
      ),
      Tab(
        icon: FaIcon(FontAwesomeIcons.circleUp,color: Colors.green,),
        text: "Gelir",
      ),
    ],),
  );
}
