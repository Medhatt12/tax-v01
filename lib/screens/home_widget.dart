import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:tax_v1/screens/Services_tab.dart';
import 'package:tax_v1/screens/calculator_tab.dart';
import 'package:tax_v1/screens/dashboard_tab.dart';

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}



class _HomeState extends State<Home> {
 int currentTabIndex =0;
 List<Widget> tabs = [
    DashboardScreen(),
    ServicesScreen(),
    CalculatorScreen(),
  ];
 onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('RTA DemoApp'),
     ),
      body: tabs[currentTabIndex],
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTapped,
       currentIndex: currentTabIndex, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.dashboard_outlined, color: Colors.black,),
           activeIcon: new Icon(Icons.dashboard_outlined, color: Colors.red,),
           title: new Text('Dashboard', style: TextStyle(color: Colors.black),),
         
         ),
         BottomNavigationBarItem(
          //  icon: new Icon(Icons.home_repair_service_outlined, color: Colors.black,),
          //  activeIcon: new Icon(Icons.home_repair_service_outlined, color: Colors.red,),
          //  title: new Text('Services', style: TextStyle(color: Colors.black),),
          icon: Badge(
          shape: BadgeShape.square,
          borderRadius: BorderRadius.circular(5),
          position: BadgePosition.topEnd(top: -12, end: -20),
          padding: EdgeInsets.all(2),
          badgeContent: Text(
            'SOON',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          child: new Icon(Icons.home_repair_service_outlined, color: Colors.black,),
         ),
            //activeIcon: new Icon(Icons.home_repair_service_outlined, color: Colors.red,),
            activeIcon: Badge(
          shape: BadgeShape.square,
          borderRadius: BorderRadius.circular(5),
          position: BadgePosition.topEnd(top: -12, end: -20),
          padding: EdgeInsets.all(2),
          badgeContent: Text(
            'SOON',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          child: new Icon(Icons.home_repair_service_outlined, color: Colors.red,)
          ),
            title: new Text('Services', style: TextStyle(color: Colors.black),),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.calculate_outlined, color: Colors.black,),
           activeIcon: new Icon(Icons.calculate_outlined, color: Colors.red,),
           title: new Text('Calculator', style: TextStyle(color: Colors.black),),
         ),
         
       ],
     ),
     drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Hello Medhat!'), 
              decoration: BoxDecoration(
                color: Colors.white, 
              ),
            ),
            ListTile(
              title: Text('My Account'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
   );
 }
}