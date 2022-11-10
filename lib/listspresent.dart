import 'package:flutter/material.dart';
class LongList extends StatelessWidget {
  LongList({required this.listOfItems});
  List listOfItems;

  @override
  Widget build(BuildContext context) {

    return Container( child: ListView.builder(
          itemCount: listOfItems.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: (){
                print('Tapped on item #$index');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listOfItems[index].toString().toUpperCase(), style: const TextStyle(color: Colors.red,
                  fontWeight: FontWeight.w400,
                  fontSize: 20 ,fontStyle: FontStyle.italic, ),)
                 //   Text('Sample subtitle for item $index'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
