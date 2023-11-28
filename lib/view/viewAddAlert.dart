import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/widget/Methods.dart';

import '../widget/MyButton.dart';

class AddAlert extends StatefulWidget {
  const AddAlert({super.key});

  @override
  State<AddAlert> createState() => _AddAlertState();
}

class _AddAlertState extends State<AddAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Uyarı Ekle'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(left: 16,right: 16,top: 16),
        width: 430.w,
        height: 200.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: MyColor.cardColor1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FaIcon(FontAwesomeIcons.solidBell,color: MyColor.iconColor,size: 60,),
            Text('Henüz hiç uyarı eklenmemiş.Belli bir gelire veya gidere ulaştığınızda bildirim almak için hemen uyarı oluşturun',style: MyStyle.textStyle()),
            const MyButton(),
          ],
        ),
      ),
    );
  }
}


