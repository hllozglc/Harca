import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/controller/AppDataController.dart';

class MyListView extends StatefulWidget {
  const MyListView({
    super.key,
  });

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  AppDataController controller = Get.find<AppDataController>();
  @override
  Widget build(BuildContext context) {
    var model = controller.expens.reversed;
    var revModel = model.toList();
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        var today = revModel[index].date;
        String date = "${today!.day}/${today!.month}/${today!.year}";
        return Dismissible(
          onDismissed: (direction) => controller.deleteExpens(revModel[index]),
          direction: DismissDirection.endToStart,
          background: Container(alignment:Alignment.centerRight,color: Colors.red,child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.delete,color: Colors.white,),
          ),),
          key: UniqueKey(),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              ListTile(
                title: Text(revModel[index].title!),
                subtitle: Text(revModel[index].subtitle!),
                leading: revModel[index].icon,
                trailing: Text('${revModel[index].price.toString()} TL'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(date.toString(),style: MyStyle.textStyle().copyWith(fontSize: 12),),
              )
            ],
          ),
        );
      },
    );
  }
}
