import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Models/place.dart';

class ReviewWidget extends StatelessWidget {
  final CityReviews reviews;
  final DateFormat format = DateFormat.yMEd();
  ReviewWidget({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(reviews.avatar as String),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(reviews.title as String),
                        Text(format.format(reviews.date as DateTime)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(reviews.subtitle as String),
                  SizedBox(
                    height: 15,
                  ),
                  Text(reviews.description as String),
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    reviews.image as String,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
