import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/Screen_filter.dart';
import 'package:meal_app/topbar.dart';
import 'package:meal_app/theme.dart';

class DrawerMain extends StatefulWidget {

  @override
  _DrawerMainState createState() => _DrawerMainState();
}

class _DrawerMainState extends State<DrawerMain> {

  String currentProfilePic = "https://cdn.pixabay.com/photo/2016/04/13/19/20/binary-1327493__340.jpg";
  String otherProfilePic = "https://cdn.pixabay.com/photo/2017/08/20/09/10/system-2660914_960_720.jpg";
  // String c_acco_mail= "reecha899@gmail.com";
  // String c_acco_name = "Reecha";
  // String a_acco_mail = "kp1234@gmail.com";
  // String a_acc_name = "kp";

  Widget buildListTile(String title, IconData icon, Function taphandler) {
    return ListTile(
      leading:   Icon(
        icon,
        size: 30,
        color: Colors.black87,
      ),
      title: Text(
        title,
        // textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: taphandler,
    );
  }
  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //   SizedBox(
                //   height: 30,
                // ),
                //   Expanded(
                //   flex: 1,
                //   child: Container(
                //     width: MediaQuery.of(context).size.width * 0.85,
                //     child: Topbar(),
                //     // DrawerHeader(
                //     //   decoration: BoxDecoration(
                //     //       image: DecorationImage(
                //     //           image: AssetImage("assets/Images/punjabi.jpg"),
                //     //           fit: BoxFit.cover)),
                //     //   child: Text("Header"),
                //     // ),
                //   ),
                //   ),
                Container(
                  height: 250,
                  // padding: EdgeInsets.all(0),
                  //width: double.infinity,
                  child: DrawerHeader(
                    padding: EdgeInsets.all(0),
                    child: Stack(
                      // height: 400,
                      //width: MediaQuery.of(context).size,
                      //width: MediaQuery.of(context).size.width * 0.85,
                      children: <Widget>[
                        TopBar(),
                        new UserAccountsDrawerHeader(
                          margin: EdgeInsets.only(top: 55),
                          accountName: new Text(
                            "Reecha",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          accountEmail: new Text(
                            "reecha899@gmail.com",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(color: Colors.transparent),
                          currentAccountPicture: new GestureDetector(
                            child: new CircleAvatar(
                              backgroundImage: new NetworkImage(currentProfilePic),
                            ),
                            onTap: () => print("This is your current account."),
                          ),
                          // currentAccountPicture: new CircleAvatar(
                          //   backgroundColor: Colors.black87,
                          //   child: new Text(
                          //     'R',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                          otherAccountsPictures: <Widget>[
                            new GestureDetector(
                              child:
                            new CircleAvatar(
                              backgroundImage: new NetworkImage(otherProfilePic),
                              // child: new Text('K'),
                            ),
                              onTap: () => switchAccounts(),
                            ),
                          ],
                        ),

                        // child: Image.asset(
                        //   "assets/Images/punjabi.jpg",
                        // ),
                      ],
                    ),
                    // decoration: BoxDecoration(
                    //   color: Colors.transparent,
                    //
                    // ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //     Column(
                // children: <Widget>[
                //   Container(
                //     height: 200,
                //     width: double.infinity,
                //     padding: EdgeInsets.all(20),
                //     alignment: Alignment.centerLeft,
                //     color: Theme.of(context).accentColor,
                //     child: Text('Cooking UP!',style: TextStyle(fontSize: 40,color: Colors.black87,fontWeight: FontWeight.bold),),
                //   ),
                //   const SizedBox(height: 20,),
                const SizedBox(height: 20,),
                buildListTile(
                    'Meal',
                    Icons.restaurant, () {
                  Navigator.of(context).pushReplacementNamed('/');
                }),
                const SizedBox(height: 20,),
                buildListTile('Filters', Icons.settings, () {
                  Navigator.of(context)
                      .pushReplacementNamed(ScreenFilter.routeName);
                }),
                const SizedBox(height: 20,),
                // SizedBox(
                //   height: 45,
                // ),
                // Material(
                //   borderRadius: BorderRadius.circular(500),
                //   child: InkWell(
                //     borderRadius: BorderRadius.circular(500),
                //     splashColor: Colors.black45,
                //     onTap: () {
                //       Navigator.of(context).pop();
                //     },
                //     child: CircleAvatar(
                //       radius: 20,
                //       backgroundColor: Colors.black,
                //       child: Icon(Icons.arrow_back, color: Colors.white),
                //     ),
                //   ),
                // ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black87,
                    child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Go Back',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        'v1.0.1',
                        style: TextStyle(
                          // fontFamily: 'Avenir',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
