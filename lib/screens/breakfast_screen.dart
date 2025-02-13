
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plat/widgets/category_chip.dart';
import 'package:plat/widgets/recommendation_card.dart';

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
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'search Pancake',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            Text('Category',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryChip(label: 'Salad'),
                CategoryChip(label: 'Cake'),
                CategoryChip(label: 'Pie')
              ],
            ),
            SizedBox(height: 20),
            Text('Recommendation for Diet',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            RecommendationCard(
              imageUrl: 'assets/icons/pancake.jpg',
              title: 'Pancake',
              details: 'Pancake is a flat cake, often thin and round, prepared from a starch-based batter that may contain eggs, milk, and butter and cooked on a hot surface such as a griddle or frying pan, often frying with oil or butter.'
            ),
          ],
        ) ,

      ),

    );

  }

}
