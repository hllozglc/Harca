import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harca/core/controller/AppDataController.dart';
import 'package:harca/models/barModel/barModel.dart';
import 'package:harca/widget/Methods.dart';
import 'package:harca/widget/MyListView.dart';
import 'package:harca/widget/emtyData.dart';

class ExpenseChart extends StatefulWidget {
  const ExpenseChart({super.key});

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  List<double> days = <double>[0,0,0,0,0,0,0];
  AppDataController appCtrl = Get.find<AppDataController>();
  void getDay(){
    for(int i = 0;i<appCtrl.expens.length;i++){
      if(appCtrl.expens[i].date!.weekday == DateTime.monday){
        days[0] = (appCtrl.expens[i].price!/10)*-1;
      }
      else if(appCtrl.expens[i].date!.weekday == DateTime.tuesday){
        days[1] = (appCtrl.expens[i].price!/10)*-1;
      }
      else if(appCtrl.expens[i].date!.weekday == DateTime.wednesday){
        days[2] = (appCtrl.expens[i].price!/10)*-1;
      }
      else if(appCtrl.expens[i].date!.weekday == DateTime.thursday){
        days[3] = (appCtrl.expens[i].price!/10)*-1;
      }
      else if(appCtrl.expens[i].date!.weekday == DateTime.friday){
        days[4] = (appCtrl.expens[i].price!/10)*-1;
      }
      else if(appCtrl.expens[i].date!.weekday == DateTime.saturday){
        days[5] = (appCtrl.expens[i].price!/10)*-1;
      }
      else if(appCtrl.expens[i].date!.weekday == DateTime.sunday){
        days[6] = (appCtrl.expens[i].price!/10)*-1;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    getDay();
   BarData myBarData = BarData(
        pazartesi: days[0],
        sali: days[1],
        carsamba: days[2],
        persembe: days[3],
        cuma: days[4],
        cumartesi: days[5],
        pazar: days[6]
    );
   myBarData.initializedBarData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: 'Harcama Grafiği'),
      body: appCtrl.totalExpense() == 0 ? const EmptyData(title: 'Grafik İçin Bir kaç Veri Gerekiyor') : Column(
        children: [
          Expanded(
            flex: 1,
            child: BarChart(
                BarChartData(
                    maxY: 100,
                    minY: 0,
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData:FlTitlesData(show: true,
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,getTitlesWidget: getBottomTitles)),
                    ),
                    barGroups: myBarData.barData
                        .map(
                          (data) => BarChartGroupData(
                        x:data.x,
                        barRods:[
                          BarChartRodData(toY: data.y,color: Colors.grey[800],
                              width: 25,
                              borderRadius: BorderRadius.circular(0),
                              backDrawRodData: BackgroundBarChartRodData(show: true,color: Colors.grey[200],toY: 100)
                          ),
                        ],
                      ),
                    ).toList()
                )),
          ),
          const Expanded(flex: 2,child: MyListView()),
        ],
      ),
    );
  }

 Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14);
    Widget text;
    switch (value.toInt()){
      case 1:
        text = const Text('P',style: style,);
        break;
      case 2:
        text = const Text('S',style: style,);
        break;
      case 3:
        text = const Text('Ç',style: style,);
        break;
      case 4:
        text = const Text('P',style: style,);
        break;
      case 5:
        text = const Text('C',style: style,);
        break;
      case 6:
        text = const Text('Ct',style: style,);
        break;
      case 7:
        text = const Text('P',style: style,);
        break;
      default:
        text = const Text('',style: style,);
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
 }
}
