import 'package:flutter/material.dart';
import 'package:wer/listspresent.dart';
import 'package:wer/main.dart';
import 'route.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PathFinder extends StatefulWidget {
  PathFinder({required this.path,required this.line1,required this.line2,required this.interchange,required this.time});
  var line1;
  var line2;
  var interchange;
  var time;
  var path;

  @override
  State<PathFinder> createState() => _PathFinderState();
}

class _PathFinderState extends State<PathFinder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shortest path'),)
      ,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Line Changes',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Line 1',style: TextStyle(fontSize: 20,),),
                      Text('Line 2',style: TextStyle(fontSize: 20,),),
                      Text('Station',style: TextStyle(fontSize: 20,),),
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
                              Expanded(child: LongList(listOfItems: line2),flex: 1,),
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
                color: Colors.blue,
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
      )
        ,

    );
  }
}












// var ttt;
//
// class PathFinder extends StatelessWidget {
//   PathFinder({super.key,  required this.source,required this.dest});
//   String source='';
//   String dest='';
//   var patth;
//   @override
//
//   Future<dynamic>  fetchAlbum() async {
//     final response = await http
//         .get(Uri.parse('https://us-central1-delhimetroapi.cloudfunctions.net/route-get?from=$source&to=$dest'));
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       //  print (Album.fromJson(jsonDecode(response.body)));
//       var data= response.body.toString();
//        patth= jsonDecode(data)["path"];
//       print(patth);
//
//       return (data);
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return   Container(
//           child: GestureDetector(
//             onTap: () async {
//               String tt= await fetchAlbum();
//             ttt=tt;
//             Text('$tt[0]');
//             },
//
//              // child: Tesla(),
//           )
//         );
//   }
// }
//
// class Tesla extends StatefulWidget {
//   const Tesla({Key? key}) : super(key: key);
//
//   @override
//   State<Tesla> createState() => _TeslaState();
// }
//
// class _TeslaState extends State<Tesla> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TextButton(
//         onPressed: ()
//         {
//           setState(() {
//             Text('$ttt');
//           });
//         }, child: Text('ee')
//       ),
//     );
//   }
// }
//
