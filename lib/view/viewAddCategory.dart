import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/library/InputValidators.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/MyTextField.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _formKey = GlobalKey<FormState>();
  AppDataController appCtrl = Get.find<AppDataController>();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar('Kategori Ekle'),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MytextField(label: 'Kategori Adı',controller:name,validator: InputValidators.textRequired,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColor.iconColor,
        onPressed: () {
          if(_formKey.currentState!.validate()){
            appCtrl.addCategory(name.text);
            Get.back();
            Get.snackbar('Başarılı', 'Başarıyla Eklendi');
            name.clear();
          }
      },child: const FaIcon(FontAwesomeIcons.plus,),),
    );
  }
}
