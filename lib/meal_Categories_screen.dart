import 'package:flutter/material.dart';
import 'package:meal_app/MODEL/meal.dart';
import 'package:meal_app/DUMMY_DATA.dart';
import 'package:meal_app/Item_Meal.dart';
import './MODEL/meal.dart';

class MealCategoriesScreen extends StatefulWidget {

  static const routeName = '/categories';
  final List<Meal> availableMeal;

  MealCategoriesScreen(this.availableMeal);

  _MealCategoriesScreenState createState() => _MealCategoriesScreenState();
}

 class _MealCategoriesScreenState extends State<MealCategoriesScreen>{

  String categoryTitle;
  List<Meal> displayedMeal;
  var _loadedInitData = false;

  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData) {
      final routeArg = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArg['title'];
      final categoryId = routeArg['id'];
      displayedMeal = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData =true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal ( String mealId){
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle,style: TextStyle(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.grey[800],
            onPressed: () {},
          ),
        ],
      ),
      body:  Stack(
          children: <Widget> [
      Container(
      decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/Images/bg.jpg"),
      fit: BoxFit.cover,
    ),
    ),
    child: ListView.builder(itemBuilder:( ctx , index) {
        return ItemMeal(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
        );
      } , itemCount:displayedMeal.length,
    ),
    ),
    ],
      ),
    );
  }
}
