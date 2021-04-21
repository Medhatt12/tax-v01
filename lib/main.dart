import 'package:flutter/material.dart';
import 'screens/home_widget.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'RTA Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(primaryColor: Colors.white),
      home: Home(), 
    );
  }
}

// class MyHomePage extends StatelessWidget {

//   final String title;

//   MyHomePage({Key key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title),),
//       body: Center(child: Text('Calculator')),
      
//     );
//   }
// }

// class MyHomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return DefaultTabController(
//   length: 2,
//   child: Scaffold(
//     appBar: AppBar(
//       bottom: TabBar(
//         tabs: [
//           Tab(icon: Icon(Icons.dashboard_outlined)),
//           Tab(icon: Icon(Icons.calculate_outlined)),
//         ],
//       ),
//      // title: Text('RTA Demo'),
//     ),
//     body: TabBarView(
//       children: [
//         Icon(Icons.dashboard_outlined, size: 350),
//         Icon(Icons.calculate_outlined, size: 350),
//       ],
//     ),
//     drawer: Drawer(
//         // Add a ListView to the drawer. This ensures the user can scroll
//         // through the options in the drawer if there isn't enough vertical
//         // space to fit everything.
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Hello X'), 
//               decoration: BoxDecoration(
//                 color: Colors.white, 
//               ),
//             ),
//             ListTile(
//               title: Text('My Account'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text('Sign Out'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//   ),
// );
//   }
// }
