import 'package:bind_test/model/brend_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';
class BuildListTile extends StatelessWidget {

  final BrendModel brend;
  const BuildListTile({Key? key,required this.brend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Container(
      color: Colors.white,
      child: ListTile(
        title: Text(brend.name!),
        subtitle: Text(brend.dateTime!.toString()),
        leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(brend.image.toString()), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(80)),
        ),
        trailing: Text(brend.price! + provider.title),
      ),
    );
  }
}