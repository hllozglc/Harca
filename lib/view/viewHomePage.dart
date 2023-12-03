import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/main.dart';
import 'package:harca/widget/MyDrawer.dart';
import '../widget/Methods.dart';
import '../widget/MyListView.dart';
import '../widget/emtyData.dart';
import '../widget/mainMenuCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppDataController appCtrl = Get.find<AppDataController>();
  Color mainPriceText() {
    if (appCtrl.alertList.isEmpty) {
      return MyColor.textColor;
    } else if (appCtrl.alertList.isNotEmpty && appCtrl.alertList.first.price != null) {
      double alertPrice = appCtrl.alertList.first.price!;
      double totalExpense = appCtrl.totalExpense() ?? 0;

      if (alertPrice > totalExpense) {
        return Colors.green;
      }
    }
    return Colors.red;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: MyAppBar('Ana Sayfa'),
      body: GetX<AppDataController>(
        builder: (AppDataController controller) {
        return  Column(
          children: [
            Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  decoration:  BoxDecoration(color: appCtrl.totalExpense() == null ? Colors.grey[100] : appCtrl.totalExpense()! > 0 ? Colors.green[50]: Colors.red[50], borderRadius: BorderRadius.circular(20),border: Border.all(color: mainPriceText(),width: 5)),
                  child: appCtrl.alertList.isEmpty ? Center(
                    child: Text('${appCtrl.totalExpense()??"0"} TL',
                      style: GoogleFonts.vinaSans(
                        fontSize: 60,
                        color: mainPriceText(),
                      ),
                    ),
                  ) : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${appCtrl.totalExpense()??"0"} TL',
                          style: GoogleFonts.vinaSans(
                            fontSize: 60,
                            color: mainPriceText(),
                          ),
                        ),
                        Text('Uyarı Oluşturuldu Uyarı Tartarı ${appCtrl.alertList.first.price} TL')
                      ],
                    ),
                  ) ,
              ),
            ),
            Row(children: [
              Expanded(child: MainMenuCard(icon: FontAwesomeIcons.solidBell,title:'Uyarılar',text:'Belli bir gelire veya gidere ulaştığınızda bildirim alın',color: MyColor.cardColor1,onTap: () => Get.toNamed(addAlert))),
              Expanded(child: MainMenuCard(icon: FontAwesomeIcons.filter, title: 'Filtrele', text: 'Harcamalarınızı Filtreleyin.',color: MyColor.cardColor2,onTap: () => Get.toNamed(expenseFilter),)),],),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Son Hareketler',style: MyStyle.textStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500),),
                  TextButton(onPressed: (){}, child: Text('Tümünü gör',style: MyStyle.textStyle().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                    color: Colors.blue,
                  ),
                  ),
                  ),
                ],
              ),
            ),
            Expanded(child: appCtrl.expens.isEmpty ? const EmptyData(title: 'Henüz Hiç Kayıt Yok!') : const MyListView(),),
          ],
        );
      },)
    );
  }
}


