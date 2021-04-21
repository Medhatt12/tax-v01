import 'package:flutter/material.dart';
import 'package:tax_v1/models/chart_model.dart';
import 'package:tax_v1/models/dashboard_model.dart';
import 'package:tax_v1/models/services_model.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              'Welcome back, Medhat!',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 300.0,
            // color: Colors.grey[50],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: elements.length,
              itemBuilder: (BuildContext context, int index) {
                Dashboardelements element = elements[index];
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 210.0,
                  child:
                      Stack(alignment: Alignment.topCenter, children: <Widget>[
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                        height: 120.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${elements[index].elementName}',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 180.0,
                              image: AssetImage(elements[index].imageURL),
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              'Charts',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
           Container(
            height: 400.0,
            // color: Colors.grey[50],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: charts.length,
              itemBuilder: (BuildContext context, int index) {
                Charts chart = charts[index];
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 310.0,
                  child:
                      Stack(alignment: Alignment.topCenter, children: <Widget>[
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                        height: 220.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${charts[index].chartName}',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 280.0,
                              width: 280.0,
                              image: AssetImage(charts[index].imageURL),
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                );
              },
            ),
          ),
        ])));
  }
}
