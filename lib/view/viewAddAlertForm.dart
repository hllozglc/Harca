import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/providers/alertProvider.dart';
import 'package:harca/models/alertModel.dart';
import 'package:harca/view/viewAddAlert.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/MyTextField.dart';

class AddAlertForm extends StatefulWidget {
  const AddAlertForm({super.key});

  @override
  State<AddAlertForm> createState() => _AddAlertFormState();
}

class _AddAlertFormState extends State<AddAlertForm> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar('Uyarı Oluştur'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          children: [
            MytextField(label: 'Uyarı Adı', controller: t1),
            const SizedBox(height: 10),
            MytextField(label: 'Tutar', controller: t2),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) => FloatingActionButton(
          onPressed: () {
            ref.watch(alertNotifierProvider.notifier).addAlert(AlertModel(t1.text, double.parse(t2.text)));
            Navigator.pushNamed(context, '/addAlert');
          },
          backgroundColor: MyColor.iconColor,
          child: const FaIcon(FontAwesomeIcons.plus),
        ),
      ),
    );
  }
}
