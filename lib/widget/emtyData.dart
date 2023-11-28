import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/constants/style.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.circleExclamation,size: 50,color: MyColor.iconColor.withOpacity(0.3),),
            SizedBox(height: 20.h),
            Text('Henüz Hiç Kayıt Yok!',style: MyStyle.titleStyle().copyWith(color: MyColor.titleColor.withOpacity(0.3)),)
          ],
        ),
      )
    );
  }
}
