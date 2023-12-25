import 'package:harca/models/barModel/IndividualBar.dart';

class BarData {
  final double pazartesi;
  final double sali;
  final double carsamba;
  final double persembe;
  final double cuma;
  final double cumartesi;
  final double pazar;

  BarData({
    required this.pazartesi,
    required this.sali,
    required this.carsamba,
    required this.persembe,
    required this.cuma,
    required this.cumartesi,
    required this.pazar
  });

  List<IndividualBar> barData = <IndividualBar>[];

  void initializedBarData() {
    barData = [
      IndividualBar(x: 1, y: pazartesi),
      IndividualBar(x: 2, y: sali),
      IndividualBar(x: 3, y: carsamba),
      IndividualBar(x: 4, y: persembe),
      IndividualBar(x: 5, y: cuma),
      IndividualBar(x: 6, y: cumartesi),
      IndividualBar(x: 7, y: pazar),
    ];
  }
}
