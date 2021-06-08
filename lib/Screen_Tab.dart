import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/MODEL/CATEGORY.dart';
import 'package:meal_app/Screen_Categories.dart';
import 'package:meal_app/Screen_Favourite.dart';
import 'package:meal_app/Drawer_mian.dart';
import './MODEL/meal.dart';
import 'package:meal_app/Home.dart';

class ScreenTab extends StatefulWidget {

  final List<Meal> favouriteMeals;
  final Function toggleCheck;
  final Function ischeckitem;
  final List<Category> checkitems;

  ScreenTab({this.favouriteMeals, this.toggleCheck, this.ischeckitem,this.checkitems});

  @override
  _ScreenTabState createState() => _ScreenTabState();
}

class _ScreenTabState extends State<ScreenTab> {

  List<Map<String,Object>> _pages;

 int _selectedPageIndex = 0;

 @override
  void initState() {
   _pages =  [
     {
       'page': home(toggleCheck: widget.toggleCheck,ischeckitem: widget.ischeckitem,),
       'title': 'home',
     },
     {
       'page': ScreenCategories(checkitems: widget.checkitems,),
       'title': 'Categories',
     },
     {
       'page': ScreenFavourite(widget.favouriteMeals),
       'title': 'Favourite',
     },
   ];
    super.initState();
  }

 void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'],style: TextStyle(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.bold),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.grey[800],
            onPressed: () {},
          ),
        ],
      ),
     drawer:  DrawerMain(),
     body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 50,
        onTap: _selectPage,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Theme.of(context).accentColor,
        color: Theme.of(context).primaryColor,
        animationDuration:Duration(
            milliseconds: 800
        ),
        // unselectedItemColor: Colors.white,
        // selectedItemColor: Theme.of(context).accentColor,
        // currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
          animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Icon(Icons.home,size: 30,color: Colors.black87,),
            Icon(Icons.category,size: 30,color: Colors.black87,),
          Icon(Icons.star,size: 30,color: Colors.black87,),
          // BottomNavigationBarItem(
          //   backgroundColor: Theme.of(context).primaryColor,
          //   icon: Icon(Icons.category),
          //   title: Text('Categories'),
          // ),
          // BottomNavigationBarItem(
          //   backgroundColor: Theme.of(context).primaryColor,
          //   icon: Icon(Icons.star),
          //   title: Text('Favourite'),
          // ),
        ],
      ),
    );
  }
}

