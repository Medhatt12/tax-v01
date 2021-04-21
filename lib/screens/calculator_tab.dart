import 'package:flutter/material.dart';
import 'package:tax_v1/models/dashboard_model.dart';
import 'package:tax_v1/models/unit_model.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //final Color color;
  //CalculatorScreen();
  int _selectedindex =0;

  final _text = TextEditingController();
  bool _validate = false;
  static double exemptionlimit = 24000;
  static double netRvalue = 0.7;
  static double taxValue = 0.1;
  static double monthlyrentalvalue;
  static double annualrentalvalue;
  static double temp;
  static double temp1;
  static double temp2;

  static double taxCalculatorInhibited(double monthlyrentalvalue) {
    annualrentalvalue = monthlyrentalvalue * 12;
    //taxbase=annualrentalvalue-exemptionlimit;
    temp = annualrentalvalue * netRvalue;
    temp1 = temp - exemptionlimit;
    temp2 = temp1 * taxValue;
    return temp2;
  }

  static double taxCalculatorUninhibited(double monthlyrentalvalue) {
    annualrentalvalue = monthlyrentalvalue * 12;
    //taxbase=annualrentalvalue-exemptionlimit;
    temp = annualrentalvalue * netRvalue;
    //temp1= temp-exemptionlimit;
    temp1 = temp * taxValue;
    return temp1;
  }

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
              'Please choose Unit\'s type',
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: units.length,
              itemBuilder: (BuildContext context, int index) {
                Units unit = units[index];
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _selectedindex = units[index].indexed;
                      print(_selectedindex);
                    });
                  },
                                  child: Container(
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
                            color: _selectedindex == index ?Colors.grey: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${units[index].unitType}',
                                    style: TextStyle(
                                      color:  _selectedindex == index ?Colors.white: Colors.black,
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
                                image: AssetImage(units[index].imageURL),
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                );
              },
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: new Theme(
                        data: new ThemeData(
                          primaryColor: Colors.black,
                          primaryColorDark: Colors.black,
                        ),
                        child: new TextFormField(
                          autovalidate: true,
                          controller: _text,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
                              hintText: 'Unit\'s Monthly Rental Value',
                              helperText: 'Keep it simple, Digits Only',
                              labelText: 'Monthly Rental Value',
                              errorText:
                                  _validate ? 'Value Can\'t Be Empty' : null,
                              prefixIcon: const Icon(
                                Icons.money,
                                color: Colors.red,
                              ),
                              prefixText: ' ',
                              suffixText: 'EGP',
                              suffixStyle: const TextStyle(color: Colors.red)),
                          validator: (input) {
                            final isDigitsOnly = double.tryParse(input);
                            //monthlyrentalvalue = int.parse(input);
                            return isDigitsOnly != null || input == ""
                                ? null
                                : 'Input needs to be digits only';
                          },
                        ))),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: OutlinedButton(
                      child: Text('Calculate Tax'),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.red,
                        backgroundColor: Colors.grey[50],
                        side: BorderSide(width: 1, color: Colors.grey[400]),
                      ),
                      onPressed: () {
                        monthlyrentalvalue = double.parse(_text.text);
                        showDialog(
                          context: context,
                          builder: (context) {
                            if(_selectedindex == 0){
                            return AlertDialog(
                              content: Text("Your Annual Tax is " +
                                  taxCalculatorInhibited(monthlyrentalvalue)
                                      .toString() +
                                  " EGP"),
                            );
                            }if(_selectedindex == 1){
                              return AlertDialog(
                              content: Text("Your Annual Tax is " +
                                  taxCalculatorUninhibited(monthlyrentalvalue)
                                      .toString() +
                                  " EGP"),
                            );
                            }
                          },
                        );
                      },
                      onLongPress: () {
                        print('Long press');
                      },
                    ))
              ]),
        ])));
  }
}
