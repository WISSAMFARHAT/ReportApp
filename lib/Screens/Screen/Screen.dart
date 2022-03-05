import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:maliks/Welcome/Welcome.dart';

import '../../constant.dart';
import 'Pages/Profile.dart';
import 'Pages/Report.dart';
import 'Pages/History.dart';

class Screen extends StatefulWidget {
  final String value;
  const Screen({Key? key, required this.value}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int currentindex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  static get value => null;
  @override
  Widget build(BuildContext context) {
    final screens = [
      Report(branch:widget.value),
      Profile(branch:widget.value),
      History(branch:widget.value),
      null
    ];
    return SafeArea(
      top: false,
      child: Scaffold(
          extendBody: true,
          body: screens[currentindex],
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: currentindex,
            onTap: (index) => setState(() {
              currentindex = index;
              if(index==3)
                {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Welcome() ));
                }
            }),
            color: Ksecond,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: kprimary,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            letIndexChange: (index) => true,
            height: 60.0,
            items: const [
              Icon(Icons.file_copy, size: 25, color: Colors.white),
              Icon(Icons.person, size: 25, color: Colors.white),
              Icon(Icons.history, size: 25, color: Colors.white),
              Icon(Icons.logout, size: 25, color: Colors.white),
            ],
          )),
    );
  }
}
