import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class RecommendationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String details;

  RecommendationCard({required this.imageUrl, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
           SvgPicture.asset(imageUrl, width: 60, height: 60),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 18)),
                Text(details),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('View'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}