import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
//import 'package:search_choices/search_choices.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:wer/pathFinder.dart';
import 'main.dart';
import 'pathFinder.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'listofstation.dart';
import 'findtime.dart';

class RouteProv extends StatelessWidget {
  const RouteProv({Key? key}) : super(key: key);

  static const String _title = 'Metro Navigator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title:  _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
var time;
var line1;
var line2;
var interchange;
var path;
var stationsss;
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List listOfItems =[ 's','d','g']; final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
  String Source="Select Source Station";
  String Dest="Select Destination";
  void itemSelectionChangedSource(String? s) {
    setState(() {
      Text("Selected Value is $s");
    });
    Source=s!;
    print(s);
  }
  Future<void> itemSelectionChangedDest(String? s) async {
    setState(() {
      Text("Selected Value is $s");
    });

    Dest=s!;
    print(Dest);
    await fetchAlbum();
    print(s);
  }
  Future<dynamic> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://us-central1-delhimetroapi.cloudfunctions.net/route-get?from=$Source&to=$Dest'));


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //  print (Album.fromJson(jsonDecode(response.body)));
      var data= response.body.toString();
      var patth= jsonDecode(data)["path"];
      var timee= jsonDecode(data)["time"].round();
      var lin2= jsonDecode(data)["line2"];
      var lin1= jsonDecode(data)["line1"];
      var ic= jsonDecode(data)["interchange"];
      stationsss=patth.length;
      print(data);
      path=patth;
      time=timee.round();
      line1=lin1;
      line2=lin2;
      interchange=ic;
      return (jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(height: 50,
         // //+
                // margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
              //  padding: const EdgeInsets.all(20),
                child: const Text(
                  'Plan Your journey',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(

              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('Enter Source Station',style: TextStyle(color: Colors.brown,
                        fontWeight: FontWeight.w800,
                        fontSize: 20 ,fontStyle: FontStyle.italic )),
                  ),



                  Padding(padding: EdgeInsets.all(4)),
                  Row(
                    children: [

                         Expanded(
                          child:  DropdownSearch<String>(
                            //mode of dropdown
                            mode: Mode.DIALOG,
                            //to show search box
                            showSearchBox: true,
                            showSelectedItem: true,
                            //list of dropdown items
                          //  items: const ['Jahengirpuri','Alpha 1','Arthala','Dwarka','Palam','Kashmere Gate','chandni chowk','Karol Bagh','Noida Sector 61','Rajiv Chowk','Jahengirpuri','Kashmere Gate','Chandni Chowk','Karol Bagh','Noida Sector 61','rajiv chowk'],
                            items: listOfStations,
                            label: "Select Soucre Station",
                            onChanged: itemSelectionChangedSource,
                            //show selected item
                            selectedItem: "Select Soucre Station",


                          ),
                      ),
                   //   const Padding(padding: EdgeInsets.all(4)),

                    ],
                  ),

                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text('Enter Destination',style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.w800,
                  fontSize: 20 ,fontStyle: FontStyle.italic )),
            ),
            // Container(
            //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            //   child: const TextField(
            //
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Destination',
            //     ),
            //   ),
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: DropdownSearch<String>(
            //         items: ['jahengirpuri','kashmere gate','chandni chowk','karol bagh','noida sector 61','rajiv chowk','enter source station','jahengirpuri','kashmere gate','chandni chowk','karol bagh','noida sector 61','rajiv chowk'],
            //       ),
            //     ),
            //
            //   ],
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownSearch<String>(
                //mode of dropdown
                mode: Mode.DIALOG,
                //to show search box
                showSearchBox: true,
                showSelectedItem: true,
                //list of dropdown items
            //      items: ['jahengirpuri','Dwarka','Palam','kashmere gate','chandni chowk','karol bagh','noida sector 61','rajiv chowk','enter source station','jahengirpuri','kashmere gate','chandni chowk','karol bagh','noida sector 61','rajiv chowk'],
             //   items: const ['Jahengirpuri','Alpha 1','Arthala','kashmere gate','Dwarka','Palam','chandni chowk','Karol Bagh','Noida Sector 61','Rajiv Chowk','Jahengirpuri','Kashmere Gate','Chandni Chowk','Karol Bagh','Noida Sector 61','rajiv chowk'],
               items: listOfStations,
                label: "Select Destination",
                onChanged: itemSelectionChangedDest,
                //show selected item
                selectedItem: "Select Destination",


              ),
            ),
            SizedBox(height: 20,),
            Container(
                //height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GestureDetector( onTap: () {
                setState(()  {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) {
                    return PathFinder(line1: line1,line2: line2,interchange: interchange,time: time.round(),path: path);
                  },
                  ),
                  );
                });

                // Navigator.push(context, CupertinoPageRoute(builder: (context) {
                //   return PathFinder(source: Source, dest: Dest);
                // },
                // ),
                // );
              },
                  child: BasicBox2(heading: 'Shortest Route'),
              ),
                // child: ElevatedButton(
                //   child: const Text('Shortest Route',style: TextStyle(fontSize: 20),),
                //   onPressed: () {
                //     print(nameController.text);
                //     print(passwordController.text);
                //   },
                // )
            ),
            SizedBox(height: 20,),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
               child: GestureDetector( onTap: (){
                 setState(()  {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return FindTime(line1: line1,line2: line2,interchange: interchange,time: time,path: path);
                },
                ),
                );
                 });

                },
                    child: BasicBox2(heading: 'Time Required',)
                ),

                // child: ElevatedButton(
                //   child: const Text('Fare required',style: TextStyle(fontSize: 20),),
                //   onPressed: () {
                //     print(nameController.text);
                //     print(passwordController.text);
                //   },
                // )
            ),
            // Container(
            //   child: Text('$ttt',style: TextStyle(fontSize: 30),)
            // )

          ],
        ));
  }
}

