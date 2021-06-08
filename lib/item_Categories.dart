import 'package:flutter/material.dart';
import 'package:meal_app/meal_Categories_screen.dart';

class ItemCategories extends StatelessWidget {
  final String id;
  final String title;
  // final Color color;
  final String image;

  ItemCategories(this.id,this.title,this.image);

  void Select(BuildContext ctx){
   Navigator.of(ctx).pushNamed(
     MealCategoriesScreen.routeName,
     arguments: {
       'id': id,
       'title': title
     },
   );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Select(context),
        splashColor: Theme.of(context).primaryColor,
        child: Container(
      padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image),
                  fit: BoxFit.cover,
              ),
            borderRadius: BorderRadius.circular(15),
          ),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(colors: [color.withOpacity(0.7),color],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //   ),
      //   borderRadius: BorderRadius.circular(15),
      // ),
      child: Text(title, style: Theme.of(context).textTheme.title,),
    ),
    );
  }
}
