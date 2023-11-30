import 'package:flutter/material.dart';
import 'package:harca/library/InputValidators.dart';

import '../constants/style.dart';

class MytextField extends StatelessWidget {
  const MytextField({super.key, required this.label,required this.controller, this.validator,this.keyboard});
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: MyColor.textColor.withOpacity(0.8)),
          focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          label:Text(label),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
      ),
    );
  }
}