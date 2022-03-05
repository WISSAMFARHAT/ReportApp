import 'package:flutter/material.dart';

import '../../constant.dart';

class background extends StatefulWidget {
  final Widget child;
  const background({Key? Key, required this.child}) : super(key: Key);
  @override
  _background createState() => _background(child: child);
}

class _background extends State<background> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  final Widget child;

  _background({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //return total size , w ,hof screen
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: SizedBox(
          child: Stack(alignment: Alignment.center, children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: child,
            ),
            Positioned(
              bottom: size.height - 80,
              right: 100,
              left: 0,
              top: 0,
              child: Container(
                width: size.width * 0.7,
                height: 50,
                decoration: const BoxDecoration(
                    color: Ksecond,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(80))),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 100,
              top: size.height - 80,
              child: Container(
                width: size.width * 0.7,
                height: 50,
                decoration: const BoxDecoration(
                    color: Ksecond,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        bottomLeft: Radius.circular(25))),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 40,
              left: 50,
              top: size.height - 60,
              child: const Text(
                "Developed by The Services Departement",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
