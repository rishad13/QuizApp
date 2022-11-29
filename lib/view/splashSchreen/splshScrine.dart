import 'package:flutter/material.dart';
import 'package:quiz/Condrolers/provider.dart';
import 'package:quiz/view/Home_screen/MyHome.dart';
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}


class _splashScreenState extends State<splashScreen> {
  @override
  initState() {
    super.initState();
    _navigateToHomePage();
  }
  _navigateToHomePage()async{
    await Future.delayed(Duration(seconds: 4),(() {
      
      
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MyHome())));
    }));
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 500,
            height: 650,
            child: Image.asset('assets/images/quize.png'),
          )
        ],
      ) ),
    );
  }
}


