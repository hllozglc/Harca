import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text('title'),
          subtitle: Text('subtitle'),
          leading: Icon(Icons.exposure,size: 40,),
          trailing: Text('999TL'),
        );
      },
    );
  }
}
