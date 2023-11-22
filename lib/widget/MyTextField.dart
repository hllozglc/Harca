import 'package:flutter/material.dart';

import '../constants/style.dart';

class MytextField extends StatelessWidget {
  const MytextField({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: MyColor.textColor.withOpacity(0.8)),
          focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          label:Text(label),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
      ),
    );
  }
}