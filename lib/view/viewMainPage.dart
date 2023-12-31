import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/view/viewAddExpense.dart';
import 'package:harca/view/viewAllExpense.dart';
import 'package:harca/view/viewHomePage.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;
  Widget getPages() {
    switch (_pageIndex) {
      case 0:return const HomePage();break;
      case 1:return const AddExpense();break;
      case 2:return const AllExpense();break;
      default:
        return const HomePage();
    }
  }
  void onItemTapped(int value) {
    setState(() {
      _pageIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: getPages(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 1,
        unselectedLabelStyle: GoogleFonts.rubik(fontSize: 12),
        selectedLabelStyle: GoogleFonts.rubik(fontSize: 16,fontWeight: FontWeight.w500),
        selectedItemColor: MyColor.textColor,
        currentIndex: _pageIndex,
        onTap: (value) {
         onItemTapped(value);
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




