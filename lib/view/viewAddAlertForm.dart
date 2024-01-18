import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/main.dart';
import 'package:harca/models/alertModel.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/MyTextField.dart';

class AddAlertForm extends StatefulWidget {
  const AddAlertForm({super.key});

  @override
  State<AddAlertForm> createState() => _AddAlertFormState();
}

class _AddAlertFormState extends State<AddAlertForm> {
  AppDataController appCtrl = Get.find<AppDataController>();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColor,
      appBar: MyAppBar(title: 'Uyarı Oluştur'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            MytextField(label: 'Uyarı Adı', controller: t1),
            const SizedBox(height: 10),
            MytextField(label: 'Tutar', controller: t2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appCtrl.addALert(AlertModel(t1.text, double.parse(t2.text), t1.text));
          Get.offNamed(mainPage);
          Get.snackbar('Başarılı', 'Uyarı Başarılı Bir Şekilde Kaydedildi');
        },
        backgroundColor: MyColor.iconColor,
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}
