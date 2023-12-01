import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/providers/alertProvider.dart';
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
      backgroundColor: Colors.white,
      appBar: MyAppBar('Uyarı Ekle',icon: FontAwesomeIcons.plus,onTap: () => Navigator.pushNamed(context, '/addAlertForm'),),
      body: Consumer(builder: (context, ref, child) {
       return ref.watch(alertNotifierProvider).isEmpty ? Container(
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
              MyButton(title: 'Oluştur',onTap: () {
                Navigator.pushNamed(context, '/addAlertForm');
              },),
            ],
          ),
        ) : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: ListView.builder(
           itemCount: ref.watch(alertNotifierProvider).length,
           itemBuilder: (context, index) {
             var model = ref.watch(alertNotifierProvider).reversed;
             var revmodel = model.toList();
            return Dismissible(
              onDismissed: (direction) => ref.watch(alertNotifierProvider.notifier).deleteExpense(index),
              direction: DismissDirection.endToStart,
              background: Container(alignment:Alignment.centerRight,color: Colors.red,child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.delete,color: Colors.white,),
              ),),
              key: UniqueKey(),
              child: ListTile(
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: const BorderSide(width: 0,color: Colors.white)),
                title: Text(revmodel[index].name),
                subtitle: Text(revmodel[index].price.toString()),
                leading: const FaIcon(FontAwesomeIcons.solidBell,size: 35,color: MyColor.iconColor,),
                trailing: IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.ellipsis,color: MyColor.iconColor,),)

              ),
            );
          },),
        );
      },)
    );
  }
}


