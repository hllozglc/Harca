import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harca/core/providers/expenseProvider.dart';

class MyListView extends ConsumerWidget {
  const MyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var model = ref.watch(expenseNotifierProvider);
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(model[index].title),
          subtitle: Text(model[index].subtitle),
          leading: model[index].icon,
          trailing: Text('${model[index].price.toString()} TL'),
        );
      },
    );
  }
}
