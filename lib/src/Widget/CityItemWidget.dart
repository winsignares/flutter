import 'package:flutter/material.dart';

import '../../Models/place.dart';
import 'CityWidget.dart';
import 'ReviewWidget.dart';

class CityItemWidget extends StatelessWidget {
  final City city;
  const CityItemWidget({
    Key? key,
    required this.city,
    required this.onSwipe,
  }) : super(key: key);
  final VoidCallback onSwipe;
  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 25.0,
    );

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        final double detail = details.primaryDelta as double;
        if (detail < -7) {
          onSwipe();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CityWidget(city: city),
            Spacer(),
            ReviewWidget(
              reviews: city.reviews.first,
            )
          ],
        ),
      ),
    );
  }
}
