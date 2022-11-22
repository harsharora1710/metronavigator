import 'package:flutter/material.dart';
import 'package:wer/listspresent.dart';
import 'route.dart';
class PathFinder extends StatefulWidget {
  PathFinder({required this.path,required this.line1,required this.line2,required this.interchange,required this.time,required this.sizett});
  var line1;
  var line2;
  var interchange;
  var time;
  var path;
  var sizett;

  @override
  State<PathFinder> createState() => _PathFinderState();
}

class _PathFinderState extends State<PathFinder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shortest Path',style: TextStyle(fontWeight: FontWeight.w600),),backgroundColor: Colors.red,)
      ,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Line Changes',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Line 1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
                      Text('Line 2',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      Text('Station',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ],
                  ),
                  Expanded(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Expanded(flex:4,
                          child: Column(
                            children: [
                              Expanded(child: LongList(listOfItems: line1),flex: 1,),
                            ],
                          ),
                        ),

                        Expanded(flex: 4,
                          child: Column(
                            children: [
                              Expanded(flex: 1,child: LongList(listOfItems: line2,),),
                            ],
                          ),
                        ),

                        Expanded(flex: 5,
                          child: Column(
                            children: [
                              Expanded(child: LongList(listOfItems: interchange),flex: 4,),
                            ],
                          ),
                        ),

                      ],
                    ),

                  ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Path to be taken',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),

          Expanded(child: LongList(listOfItems: path),),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
