import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/Condrolers/provider.dart';
import 'package:quiz/view/splashSchreen/splshScrine.dart';

void main(){
  runApp(
    ChangeNotifierProvider<Providers>(create:(context) => Providers(),
    child: MaterialApp(home: splashScreen(),), )
  );
}