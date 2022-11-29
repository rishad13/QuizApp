
import 'package:flutter/material.dart';
class quistons extends StatelessWidget {
  quistons({required this.Q});
  final String Q;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 90,
      width: 400,
      color: Colors.white,
      child:  Text(Q,style:TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold,
      ) ,),
    ),
        );
  }
}



  


   Divider divider() {
    return const Divider(
          height: 1,
          thickness: 1,
          color: Colors.black,
          endIndent: 10,
          indent: 10,
        );
  }

   ElevatedButton quintinmarkicon() {
    return ElevatedButton(
          onPressed: (() {}),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(10),
          ),
          child: const Icon(
            Icons.question_mark,
            color: Colors.black,
          ),
        );
  }

 Text texans() {
    return const Text(
          "Choose an answer",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        );
  }


  