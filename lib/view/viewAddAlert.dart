import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/main.dart';
import 'package:harca/widget/Methods.dart';

import '../widget/MyButton.dart';

class AddAlert extends StatefulWidget {
  const AddAlert({super.key});

  @override
  State<AddAlert> createState() => _AddAlertState();
}

class _AddAlertState extends State<AddAlert> {
  AppDataController appCtrl = Get.find<AppDataController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: MyAppBar(title: 'Uyarı Ekle'),
      body: GetX<AppDataController>(
        builder: (AppDataController controller) {
        return appCtrl.alertList.isEmpty ? Container(
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
                Get.toNamed(addAlertForm);
              },),
            ],
          ),
        ) : ListView.builder(
          itemCount: appCtrl.alertList.length,
          itemBuilder: (context, index) {
            var model = appCtrl.alertList[index];
            return Dismissible(
              onDismissed: (direction) => appCtrl.removeAlert(model),
              direction: DismissDirection.endToStart,
              background: Container(alignment:Alignment.centerRight,color: Colors.red,child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.delete,color: Colors.white,),
              ),),
              key: UniqueKey(),
              child: ListTile(
                title:Text(model.name),
                subtitle: Text(model.description),
                trailing: Text('${model.price.toString()} TL'),
                leading: const FaIcon(FontAwesomeIcons.solidBell,size: 35,color: MyColor.iconColor,),
              ),
            );
          },);
      },)
    );
  }
}


