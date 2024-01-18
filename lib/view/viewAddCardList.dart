import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/main.dart';
import 'package:harca/widget/Methods.dart';

import '../constants/style.dart';
import '../widget/MyButton.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.bgColor,
        appBar: MyAppBar(
          title: 'Kartlarım',
          icon: FontAwesomeIcons.plus,
          onTap: () => Get.toNamed(addCardForm),
        ),
        body: GetX<AppDataController>(
          builder: (AppDataController controller) {
            return controller.cardList.isEmpty
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    width: 430.w,
                    height: 200.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: MyColor.cardColor1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.creditCard,
                          color: MyColor.iconColor,
                          size: 60,
                        ),
                        Text('Henüz hiç Kart eklenmemiş.Hemen kart ekleyin', style: MyStyle.textStyle()),
                        MyButton(
                          title: 'Oluştur',
                          onTap: () {
                            Get.toNamed(addCardForm);
                          },
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.cardList.length,
                    itemBuilder: (context, index) {
                      var model = controller.cardList[index];
                      return Dismissible(
                        onDismissed: (direction) => controller.deleteCard(model),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        key: UniqueKey(),
                        child: ListTile(
                          leading: const FaIcon(
                            FontAwesomeIcons.creditCard,
                            size: 35,
                            color: MyColor.buttonColor,
                          ),
                          title: Text(model.name),
                          subtitle: Text(model.descripion ?? ""),
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
