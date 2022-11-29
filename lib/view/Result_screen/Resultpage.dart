import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quiz/view/Home_screen/MyHome.dart';
import '../../Condrolers/provider.dart';
import 'package:quiz/view/Home_screen/exitpopup.dart';

// import 'package:quiz/MyHome.dart';

class Resultpage extends StatelessWidget {
 
  late int marksObtained;

  @override
  Widget build(BuildContext context) {
  marksObtained=context.read<Providers>().mark_provider;
    return Consumer<Providers> (
      builder: (context, providers, child){
      return WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Result",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            leading: const SizedBox(),
          ),
          body: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CircularPercentIndicator(
                    animation: true,
                    radius: 75.0,
                    lineWidth: 15.0,
                    percent: marksObtained * 10 / 100,
                    animationDuration: 1200,
                    center: Text(
                      '$marksObtained/10',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    progressColor: marksObtained > 4 ? Colors.green : Colors.orange,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280),
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: marksObtained > 4
                      ? BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20))
                      : BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: marksObtained > 4
                          ? const Text(
                              "Awesome!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            )
                          : const Text(
                              "Oooops..",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: marksObtained > 4
                      ? const Text(
                          "Congratulations",
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      :  InkWell(
                        child: const Text("Try Again",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                        onTap: () {
                          providers.num_provider=1;
                          providers.choices_provider=0;
                          providers.questions_Index=0;
                          providers.mark_provider=0;
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>MyHome()));
                          
                        },
                      )),
              marksObtained > 4
                  ? const Text(
                      "You Passed the exam",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  : const Text(
                      "",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
            ],
            
          ),
        ),
        
      );
      },
    );
  }
}
