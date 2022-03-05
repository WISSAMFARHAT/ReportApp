import 'package:flutter/material.dart';

import '../../constant.dart';
import 'background.dart';
import '../../Screens/Screen/Screen.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  _bodystate createState() => _bodystate();
}

class _bodystate extends State<body> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background(
      child: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            const Text("Excited ?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
            const Text("You Should be !!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.1),
            Image.asset("Images/logo.png", width: size.width * 0.5),
            const Text("Report Form Application ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.05),
            Container(
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Ksecond),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField(

                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              dropdownColor: Ksecond,
                              hint: Row(
                                children: const [
                                  Icon(
                                    Icons.home,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 10)),
                                  Text("Select Departement",
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                              value: slecetbranch,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              onChanged: (newvalue) {
                                slecetbranch= newvalue.toString();
                                branchs=newvalue.toString();
                                setState(() {
                                  slecetbranch;
                                  branchs;
                                });

                              },
                              items: branch.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                    ));
                              }).toList(),
                            )),
                      ))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, size.height * 0.02, 0, 0)),
            Container(
              width: size.width * 0.8,
              height: 40,
              color: Ksecond,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(49),
                child: FlatButton(
                    onPressed:
                    (() {
                      if(branchs!=""){
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Screen(value:branchs.toString())));
                                        }else{
                                                  // Create button
                                      Widget okButton = FlatButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                      Navigator.of(context).pop();
                                      },
                                      );
                                          AlertDialog alert = AlertDialog(
                                          title: Text("Alert !! "),
                                          content: Text("Select Departement."),
                                          actions: [
                                          okButton,
                                          ],
                                          );
                                          // show the dialog
                                          showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                          return alert;
                                          },
                                          );
                                          }

                    }),
                    child: const Text("Login",
                        style: TextStyle(fontSize: 20, color: Colors.white))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? slecetbranch;
String branchs="";
var branch = [
  'Services Departement',
  'Stationary Departement',
  'Operation Departement',
];
