import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harca/constants/style.dart';
import 'package:harca/core/providers/expenseProvider.dart';

class MyListView extends ConsumerWidget {
  const MyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var model = ref.watch(expenseNotifierProvider).reversed;
    var revModel = model.toList();
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        DateTime today = DateTime.now();
        String date = "${today.day}/${today.month}/${today.year}";
        return Dismissible(
          onDismissed: (direction) => ref.watch(expenseNotifierProvider.notifier).deleteExpense(index),
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
                title: Text(revModel[index].title),
                subtitle: Text(revModel[index].subtitle),
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
