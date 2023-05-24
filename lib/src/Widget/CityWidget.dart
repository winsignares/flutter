import 'package:flutter/material.dart';

import '../../Models/place.dart';

class CityWidget extends StatelessWidget {
  const CityWidget({
    Key? key,
    required this.city,
  }) : super(key: key);

  final City city;
  final textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 25.0,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Card(
        child: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              city.image as String,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    city.name as String,
                    style: textStyle,
                  ),
                  Text(
                    city.price as String,
                    style: textStyle,
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
