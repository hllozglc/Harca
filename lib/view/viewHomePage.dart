import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/main.dart';
import 'package:harca/widget/MyDrawer.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        backgroundColor: MyColor.bgColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(addAlert),
              icon: const FaIcon(
                FontAwesomeIcons.solidBell,
                color: Colors.white,
              ),
            )
          ],
          backgroundColor: MyColor.primaryColor,
          elevation: 0,
          title: RichText(
            text: TextSpan(
              text: 'Merhaba, Halil',
              style: MyStyle.textStyle().copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "\nGünaydın", style: MyStyle.textStyle().copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          centerTitle: false,
        ),
        body: GetX<AppDataController>(
          builder: (AppDataController controller) {
            return Column(
              children: [
                Stack(
                  children: [
                    SizedBox(height: 300.h),
                    Container(
                        height: 180.h,
                        color: MyColor.primaryColor,
                        child: Column(
                          children: [
                            SizedBox(height: 30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(children: [
                                  Container(
                                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xff05B6E6)),
                                      padding: const EdgeInsets.all(16),
                                      child: const FaIcon(FontAwesomeIcons.wallet, color: Colors.white)),
                                  SizedBox(width: 10.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'BÜTÇE DURUMU',
                                        style: MyStyle.titleStyle().copyWith(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                      ),
                                      Text('${appCtrl.totalExpense() ?? "0"} ₺',
                                          style: MyStyle.titleStyle().copyWith(
                                            color: Colors.white,
                                            fontSize: 35,
                                          ),
                                      ),
                                    ],
                                  ),
                                ]),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(100)),
                                  child: Text(
                                    'Harcamalar',
                                    style: MyStyle.textStyle().copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                    Positioned(
                      top: 130.h,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          MainMenuCard(
                              icon: FontAwesomeIcons.chartPie,
                              title: 'Grafik',
                              text: 'Harcamalarınızı analiz için görselleştirin',
                              color: const Color(0xffDDF2FD),
                              onTap: () => Get.toNamed(reportingList)),
                          SizedBox(height: 10.h),
                          MainMenuCard(
                            icon: FontAwesomeIcons.filter,
                            title: 'Filtrele',
                            text: 'Harcamalarınızı Filtreleyin.',
                            color: const Color(0xffDDF2FD),
                            onTap: () => Get.toNamed(expenseFilter),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    'Son Hareketler',
                    style: MyStyle.textStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: appCtrl.expens.isEmpty ? const EmptyData(title: 'Henüz Hiç Kayıt Yok!') : const MyListView(),
                ),
              ],
            );
          },
        ));
  }
}
