import 'package:flutter/material.dart';
import './MODEL/meal.dart';
import 'package:meal_app/Item_Meal.dart';

class ScreenFavourite extends StatelessWidget {

  final List<Meal> favouriteMeals;

  ScreenFavourite(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget> [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
   child: favouriteMeals.isEmpty
       ?  Center(
                   child: Text('No favourite Iteams yet - Adding more',style: TextStyle(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.bold),),
         )
       : ListView.builder(itemBuilder:( ctx , index) {
        return ItemMeal(
          id: favouriteMeals[index].id,
          title: favouriteMeals[index].title,
          imageUrl:favouriteMeals[index].imageUrl,
          duration: favouriteMeals[index].duration,
          complexity: favouriteMeals[index].complexity,
          affordability: favouriteMeals[index].affordability,
        );
      } , itemCount:favouriteMeals.length,
      ),
    ),
    ],
    );
  }
}
