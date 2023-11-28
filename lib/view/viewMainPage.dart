import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/providers/bottomNavBarProvider.dart';
import 'package:harca/view/viewAddExpense.dart';
import 'package:harca/view/viewAllExpense.dart';
import 'package:harca/view/viewHomePage.dart';


class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      body: ref.watch(bottomNavBarNotifierProvider.notifier).getPages(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 1,
        unselectedLabelStyle: GoogleFonts.rubik(fontSize: 12),
        selectedLabelStyle: GoogleFonts.rubik(fontSize: 16,fontWeight: FontWeight.w500),
        selectedItemColor: MyColor.textColor,
        currentIndex: ref.watch(bottomNavBarNotifierProvider),
        onTap: (value) {
          ref.read(bottomNavBarNotifierProvider.notifier).onItemTapped(value);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Ana Sayfa',
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(FontAwesomeIcons.house,color: MyColor.navBarIconColor),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Ekle',
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(FontAwesomeIcons.plus,color: MyColor.navBarIconColor,size: 30,),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Harcamalar',
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(FontAwesomeIcons.list,color: MyColor.navBarIconColor),
            ),
          ),
        ],
      ),
    );
  }
}




