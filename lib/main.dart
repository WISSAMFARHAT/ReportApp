import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'Welcome/Welcome.dart';
import 'constant.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Report",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Ksecond,
        primaryColorLight: Ksecond,
        scaffoldBackgroundColor: kprimary,
      ),

      home: AnimatedSplashScreen(
          splash: Scaffold(
            extendBody: true,
        body:
        SingleChildScrollView(
            child: Center(
              child:    Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("Images/logo.png", width: 200),
                  SizedBox(height: 20,),
                  Container(

                    child:  Text("Report Form Application ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  )

                ],
              ),
            )

        )

      ),splashIconSize: 100,
          duration: 3000,splashTransition: SplashTransition.fadeTransition,backgroundColor: kprimary,nextScreen: Welcome()),
    );
  }
}
