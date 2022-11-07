import 'package:flutter/material.dart';
import 'package:wer/listspresent.dart';
import 'package:wer/main.dart';
import 'route.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class FindTime extends StatefulWidget {
  FindTime({required this.path,required this.line1,required this.line2,required this.interchange,required this.time});
  var line1;
  var line2;
  var interchange;
  var time=1;
  var path;


  @override
  // int timme=time.round();
  State<FindTime> createState() => _FindTimeState();
}

class _FindTimeState extends State<FindTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Required'),)
      ,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(
            height: 20,
          ),
          const Text(
            '       Time Required',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 40),
          ),
          const SizedBox(
            height: 20,
          ),

        Text('         $time mins', style: const TextStyle(color: Colors.blueGrey,
            fontWeight: FontWeight.w400,
            fontSize: 30 ,fontStyle: FontStyle.italic ),)


        ],
      )
      ,

    );
  }
}


