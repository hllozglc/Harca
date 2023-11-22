import 'package:flutter/material.dart';
import 'package:harca/widget/Methods.dart';

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
    );
  }
}
