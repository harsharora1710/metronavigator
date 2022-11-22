import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wer/pathFinder.dart';
import 'main.dart';
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
    return Scaffold(
        appBar: AppBar(title: const Text('Metro Navigator',style: TextStyle(fontWeight: FontWeight.w700,),),backgroundColor: Colors.red,),
        body: const MyStatefulWidget(),
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
var sizee;
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
      var data= response.body.toString();
      var patth= jsonDecode(data)["path"];
      var se=jsonDecode(data)["path"].length;
      var timee= jsonDecode(data)["time"].round();
      var lin2= jsonDecode(data)["line2"];
      var lin1= jsonDecode(data)["line1"];
      var ic= jsonDecode(data)["interchange"];
      stationsss=patth.length;
      print(data);
      se=se/5;
      print(se);
      path=patth;
      sizee=se.round();
      sizee=sizee*10;
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
                  'Plan Your Journey',
                  style: TextStyle(
                      color: Colors.brown,
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


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownSearch<String>(
                mode: Mode.DIALOG,
                showSearchBox: true,
                showSelectedItem: true,


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
                    return PathFinder(line1: line1,line2: line2,interchange: interchange,time: time.round(),path: path,sizett: sizee,);
                  },
                  ),
                  );
                });
              },
                  child: BasicBox2(heading: 'Shortest Route'),
              ),

            ),
            SizedBox(height: 20,),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
               child: GestureDetector( onTap: (){
                 setState(()  {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return FindTime(line1: line1,line2: line2,interchange: interchange,time: time,path: path,sizett: sizee,);
                },
                ),
                );
                 });

                },
                    child: BasicBox2(heading: 'Time/Fare ',)
                ),



            ),


          ],
        ));
  }
}

