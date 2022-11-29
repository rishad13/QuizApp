import 'package:provider/provider.dart';
import 'package:quiz/view/Home_screen/exitpopup.dart';
import 'package:flutter/material.dart';
import 'package:quiz/view/Result_screen/Resultpage.dart';
import '../../Condrolers/provider.dart';
import 'widgets.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int num = 1;
  int esampleIndex =5;

  

  Widget build(BuildContext context) {
    return Consumer<Providers>(
      builder: (context, providers, child) {
        num = providers.num_provider;

        return WillPopScope(
          onWillPop: () => showExitPopup(context),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                title: const Text(
                  "Quiz",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
                leadingWidth: 60,
                leading: SizedBox(
                  width: 60,
                  child: ElevatedButton.icon(
                    onPressed: (() {
                      showExitPopup(context);
                    }),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    label: const Text(""),
                    style: ElevatedButton.styleFrom(
                        elevation: 0, primary: Colors.transparent),
                  ),
                )),
            body: FutureBuilder(
                future: providers.fatchQitunsAPI(),
                builder: (context, Snapshot) {
                  if (Snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 15,
                          margin: const EdgeInsets.fromLTRB(20, 30, 320, 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                // ignore: prefer_const_constructors
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  blurStyle: BlurStyle.outer,
                                  offset: const Offset(0, 10),
                                ),
                              ]),
                          width: 50,
                          child: Center(
                            child: Text(
                              '$num/10',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        quistons(
                          Q: Snapshot.data!.questions[providers.questions_Index]
                              .question.name,
                        ),

                        divider(),
                        quintinmarkicon(),
                        texans(),
                        //buttons
                        SizedBox(
                          height: 70,
                          width: 380,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ElevatedButton(
                              onPressed: (() {
                                providers.changeButtonColor1();
                                providers.buttonIndex = 0;
                              }),
                              style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 245, 244, 244),
                                primary: providers.button_color_chage_provider
                                    ? Colors.black
                                    : Colors.blue,
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        "A.",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black26),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          Snapshot
                                              .data!
                                              .questions[
                                                  providers.questions_Index]
                                              .answers[0],
                                          // providers.option1,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //button2
                        SizedBox(
                          height: 70,
                          width: 380,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ElevatedButton(
                              onPressed: (() {
                                providers.changeButtonColor2();
                                providers.buttonIndex = 1;
                              }),
                              style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 245, 244, 244),
                                primary: providers.button_color_chage2_provider
                                    ? Colors.black
                                    : Colors.blue,
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        "B.",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black26),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          Snapshot
                                              .data!
                                              .questions[
                                                  providers.questions_Index]
                                              .answers[1],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //button3
                        SizedBox(
                          height: 70,
                          width: 380,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ElevatedButton(
                              onPressed: (() {
                                providers.changeButtonColor3();
                                providers.buttonIndex = 2;
                              }),
                              style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 245, 244, 244),
                                primary: providers.button_color_chage3_provider
                                    ? Colors.black
                                    : Colors.blue,
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        "C.",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black26),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          Snapshot
                                              .data!
                                              .questions[
                                                  providers.questions_Index]
                                              .answers[2],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //button4
                        SizedBox(
                          height: 70,
                          width: 380,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ElevatedButton(
                              onPressed: (() {
                                providers.changeButtonColor4();
                                providers.buttonIndex = 3;
                              }),
                              style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 245, 244, 244),
                                primary: providers.button_color_chage4_provider
                                    ? Colors.black
                                    : Colors.blue,
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        "D.",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black26),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          Snapshot
                                              .data!
                                              .questions[
                                                  providers.questions_Index]
                                              .answers[3],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        providers.buttonIndex > -1
                            ? Padding(
                                padding: const EdgeInsets.only(left: 250),
                                child: ElevatedButton(
                                    onPressed: (() {
                                      if (providers.buttonIndex ==
                                          Snapshot
                                              .data!
                                              .questions[providers.questions_Index]
                                              .correctIndex) {
                                                providers.MarkIngrice();
                                              }
                                             
                                      
                                      if (providers.buttonpress_provider > 0) {
                                        if (providers.questions_Index < 9) {
                                          providers.quistonIndexIngrice();
                                          providers.numInedxingrice();
                                        } else {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Resultpage()));
                                        }
                                      }
                                       providers.restColor();
                                    }),
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.white),
                                    child: SizedBox(
                                      height: 30,
                                      width: 60,
                                      child: Row(
                                        children: const [
                                          Text(
                                            "NEXT",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.blue,
                                          )
                                        ],
                                      ),
                                    )),
                              )
                              
                            : const SizedBox()
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        );
      },
    );
  }
}
