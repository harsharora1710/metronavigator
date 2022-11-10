import 'package:flutter/material.dart';
class MetroMap extends StatelessWidget {
  const MetroMap({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Metro Map'),backgroundColor: Colors.red,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InteractiveViewer(
              maxScale: 10,
              child: Image.asset('images/map.jpg')
          )
        ],
      ),
    );
  }
}
