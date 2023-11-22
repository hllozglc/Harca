import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/view/viewAddExpense.dart';
import 'package:harca/view/viewAllExpense.dart';
import 'package:harca/view/viewHomePage.dart';

import '../widget/Methods.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  Widget getPages() {
    switch (_selectedIndex) {
      case 0:return const HomePage();break;
      case 1:return const AddExpense();break;
      case 2:return const AllExpense();break;
      default:return const HomePage();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPages(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: GoogleFonts.rubik(fontSize: 12),
        selectedLabelStyle: GoogleFonts.rubik(fontSize: 16,fontWeight: FontWeight.w500),
        selectedItemColor: MyColor.textColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
              child: FaIcon(FontAwesomeIcons.plus,color: MyColor.navBarIconColor),
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




