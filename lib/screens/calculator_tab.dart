import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  //final Color color;
  CalculatorScreen();
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
    return temp2;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            borderSide: new BorderSide(color: Colors.teal)),
                        hintText: 'Unit\'s Monthly Rental Value',
                        helperText: 'Keep it simple, Digits Only',
                        labelText: 'Monthly Rental Value',
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text("Your Annual Tax is "+taxCalculatorInhibited(monthlyrentalvalue).toString() +" EGP"),
                        );
                        //print(monthlyrentalvalue);
                        //print();
                        //print('Pressed');
                      },);},
                      onLongPress: () {
                        print('Long press');
                      },
                    )
                  )
        ]);
  }
}
