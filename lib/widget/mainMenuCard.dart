import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/style.dart';

class MainMenuCard extends StatelessWidget {
  const MainMenuCard({super.key, required this.icon, required this.title, required this.text, required this.color,required this.onTap});
  final IconData icon;
  final String title;
  final String text;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        margin: const EdgeInsets.only(left: 8,right: 8,top: 16),
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon,size: 40,color: MyColor.iconColor.withOpacity(0.8)),
            Text(title, style: MyStyle.titleStyle()),
            Text(text,style: MyStyle.textStyle()),
          ],
        ),
      ),
    );
  }
}
