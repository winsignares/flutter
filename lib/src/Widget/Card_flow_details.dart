import 'package:flutter/material.dart';
import 'package:practica1/Models/place.dart';

import 'CityWidget.dart';

class CaardFlowDetail extends StatelessWidget {
  final City city;
  const CaardFlowDetail({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
              ),
            ),
            Scaffold(
              body: Column(children: [
                Expanded(
                  child: CityWidget(
                    city: city,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Placeholder(),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
