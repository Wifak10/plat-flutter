
import 'package:flutter/material.dart';



class BreakfastScreen extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Breakfast Screen'),
        backgroundColor: Colors.pinkAccent,

      ),

      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        ) ,

      ),

    );

  }

}
