import 'dart:async';
import 'package:metro_icons/metro_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'route.dart';
import 'metroMap.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
        "/first": (context) => MetroMap(),
          "/third": (context) => RouteProv(),

        },
        title: 'Practicum',

    home: Page(),

    );
  }
}


class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) =>
                    const SecondScreen()
                )
            )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Image(
          image: AssetImage('images/metro3.png'),
        ),
    );
  }
  }

  class SecondScreen extends StatefulWidget {
    const SecondScreen({Key? key}) : super(key: key);

    @override
    State<SecondScreen> createState() => _SecondScreenState();
  }

  class _SecondScreenState extends State<SecondScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.red,
          title: const Center(child: Text('METRO NAVIGATOR',style: TextStyle(fontWeight: FontWeight.bold),)),
        ),

        body: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const SizedBox(
            height: 20,
          ),
            Container(
                height:350,
                child: const Image(
                  //     height: 1000,
                  image: AssetImage('images/metro3.png',),)),
            //   const MyStatefulWidget(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector( onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return MetroMap();
              },
              ),
              );
            },
                child: BasicBox(heading: 'Metro Map',)
            ),
            // GestureDetector(onTap: (){
            //   Navigator.push(context, CupertinoPageRoute(builder: (context) {
            //     return FareCalc();
            //   },
            //   ),
            //   );
            // },
            //     child: BasicBox(heading: 'Fare',)
            // ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return RouteProv();
              },
              ),
              );
            },
                child: BasicBox(heading: 'Time/Route',)
            ),
          ],
        ),
      );
    }
  }


class BasicBox extends StatelessWidget {
  BasicBox({required this.heading});
  final String heading;
  @override
  Widget build(BuildContext context)
  {

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.red),
      width: double.infinity,
      //  color: Colors.blue,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 50,right: 50),
      child:  Center(child: Text(heading,style: const TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w700))),
    );
  }
}

class BasicBox2 extends StatelessWidget {
  BasicBox2({required this.heading});
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
      width: double.infinity,
      //  color: Colors.blue,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 50,right: 50),
      child:  Center(child: Text(heading,style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w700))),
    );
  }
}