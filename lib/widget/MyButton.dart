import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/style.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 430.w,
        height: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColor.buttonColor),
        child:Center(child: Text('Oluştur',style: MyStyle.titleStyle()?.copyWith(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)),
      ),
    );
  }
}