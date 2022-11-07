import 'package:flutter/material.dart';

class MetroMap extends StatelessWidget {
  const MetroMap({Key? key}) : super(key: key);
 // MetroMap({required this.height});
 //
 //  double _scale=1.0;
 //  double _previousScale=1.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Metro Map'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InteractiveViewer(
              maxScale: 7,
              child: Image.asset('images/map.jpg')
          )
        ],
      ),
    );
  }
}
