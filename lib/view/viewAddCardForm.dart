import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/library/InputValidators.dart';
import 'package:harca/main.dart';
import 'package:harca/models/cardModel.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/MyTextField.dart';

class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final _formKey = GlobalKey<FormState>();
  AppDataController appCtrl = Get.find<AppDataController>();
  TextEditingController cardName = TextEditingController();
  TextEditingController cardNo = TextEditingController();
  TextEditingController cardSkt = TextEditingController();
  TextEditingController cardCvv = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar('Kart Ekle'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MytextField(label: 'Kart Adı', controller: cardName,validator: InputValidators.textRequired,),
              SizedBox(height: 10.h),
              MytextField(label: 'Kart Numara', controller: cardNo),
              SizedBox(height: 10.h),
              MytextField(label: 'Son Kullanma Tarihi', controller: cardSkt),
              SizedBox(height: 10.h),
              MytextField(label: 'CVV', controller: cardCvv),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:MyColor.iconColor,
          onPressed: () {
            if(_formKey.currentState!.validate()){
              appCtrl.addCard(CardModel(name: cardName.text,cardNo: cardNo.text,skt: DateTime.tryParse(cardSkt.text),cvv: cardCvv.text));
              cardName.clear();
              cardNo.clear();
              cardCvv.clear();
              cardSkt.clear();
              Get.back();
            }
          },
          child: const FaIcon(FontAwesomeIcons.plus,),),
    );
  }
}
