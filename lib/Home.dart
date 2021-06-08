import 'package:flutter/material.dart';
import 'package:meal_app/DUMMY_DATA.dart';
import 'package:meal_app/MODEL/CATEGORY.dart';
import 'package:meal_app/item_home.dart';


class home extends StatefulWidget {

  static const routeName = '/home';
  final Function toggleCheck;
  final Function ischeckitem;

  home({this.toggleCheck, this.ischeckitem});

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context).settings.arguments as String;

    return Stack(
      children: <Widget> [
    Container(
    decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/Images/bg.jpg"),
    fit: BoxFit.cover,
    ),
    ),
    child: ListView.builder(
        itemCount: DUMMY_CATEGORIES.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: new EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  new CheckboxListTile(
                      activeColor: Colors.orange,
                      dense: true,
                      title: new Text(
                        DUMMY_CATEGORIES[index].title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                      value: DUMMY_CATEGORIES[index].value,
                      onChanged: (bool val) {
                        itemChange(val, index);
                      },
                  ),
                ],
              ),
            );
        }
        ),
    ),
    ],

    );
  }
  void itemChange(bool val, int index) {
    setState(() {
      DUMMY_CATEGORIES[index].value = val;
    });
    widget.toggleCheck(DUMMY_CATEGORIES[index].id);
  }
  }
