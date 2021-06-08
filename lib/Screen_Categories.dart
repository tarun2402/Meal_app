import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/DUMMY_DATA.dart';
import 'package:meal_app/MODEL/CATEGORY.dart';
import 'package:meal_app/item_Categories.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ScreenCategories extends StatefulWidget {
  final List <Category> checkitems;

  const ScreenCategories({Key key, this.checkitems}) : super(key: key);

  @override
  ScreenCategoriesState createState() => ScreenCategoriesState();
}
class ScreenCategoriesState extends State<ScreenCategories> {

  CarouselSlider carouselSlider;
  int _current =0;

  List<T> map<T>(List list, Function handler){
    List<T> result = [];
    for(var i=0; i<list.length;i++){
      result.add(handler(i,list[i]),);
    }
      return result;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                carouselSlider =  CarouselSlider(
                    height: 350.0,
                    // initialPage: 1,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    reverse: false,
                    enableInfiniteScroll: false,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 2000),
                    pauseAutoPlayOnTouch: Duration(seconds: 10),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index){
                      setState(() {
                          _current = index;
                      });
                    },
                    items: widget.checkitems?.map((ctx) {
                        return Builder(
                            builder: (BuildContext context){
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: ItemCategories(ctx.id,ctx.title,ctx.images),
                                  );
                            }
                        );
                    })?.toList()??[Container(child: Text('abc'),)],
                  ),
                 const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(
                      widget.checkitems??DUMMY_CATEGORIES ,(index,ctx){
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index ? Colors.black87 : Colors.grey[500],
                          ),
                        );
                    }
                    ),
                  ),
                 const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlineButton(onPressed: goToPrevious,
                      child: Text("<"),
                      ),
                      OutlineButton(onPressed: goToNext,
                        child: Text(">"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // child: GridView(
            //   padding: const EdgeInsets.all(25),
            //   children: DUMMY_CATEGORIES
            //       .map(
            //         (ctx) => ItemCategories(ctx.id,ctx.title,ctx.color),
            //       )
            //       .toList(),
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 270,
            //     childAspectRatio: 1,
            //     crossAxisSpacing: 20,
            //     mainAxisSpacing: 20,
            //   ),
            // ),
          ),
        ],
    );
  }
  goToPrevious(){
    carouselSlider.previousPage(duration: Duration(milliseconds: 1000),curve: Curves.ease);
  }
  goToNext(){
    carouselSlider.nextPage(duration: Duration(milliseconds: 1000),curve: Curves.decelerate);
  }
}
