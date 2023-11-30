import 'package:flutter/material.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/MyTextField.dart';

class AddAlertForm extends StatelessWidget {
  const AddAlertForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController t1 = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar('Uyarı Oluştur'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          children: [
            MytextField(label: 'Tutar', controller: t1),

          ],
        ),
      ),
    );
  }
}
