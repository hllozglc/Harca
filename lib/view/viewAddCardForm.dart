import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/library/InputValidators.dart';
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
  TextEditingController cardDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: MyAppBar(title: 'Kart Ekle'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MytextField(label: 'Kart Adı', controller: cardName, validator: InputValidators.textRequired),
              SizedBox(height: 10.h),
              MytextField(label: 'Açıklama', controller: cardDescription),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColor.iconColor,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            appCtrl.addCard(CardModel(name: cardName.text, descripion: cardDescription.text));
            cardName.clear();
            cardDescription.clear();
            Get.back();
          }
        },
        child: const FaIcon(
          FontAwesomeIcons.plus,
        ),
      ),
    );
  }
}
