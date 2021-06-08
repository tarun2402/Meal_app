import 'package:flutter/material.dart';
import 'package:meal_app/DUMMY_DATA.dart';

class itemHome extends StatelessWidget {

  final String id;
  final String title;
  itemHome(this.id,this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
    );
  }
}
