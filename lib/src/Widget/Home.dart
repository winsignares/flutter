import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:practica1/Models/place.dart';
import 'package:practica1/src/Widget/Card_flow_details.dart';
//usamos esta libreria para rotar las paginas
import 'package:vector_math/vector_math_64.dart' as vector;

import 'CityItemWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController(
    viewportFraction: 0.8,
  );
  double page = 0.0;
  @override
  void initState() {
    super.initState();
    //lo hacemos para hacer el efecto, se debe estar escuchando el scroll
    _pageController.addListener(_listener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    super.dispose();
  }

  void _onswipe(City city) {
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: CaardFlowDetail(city: city),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [_btnbuscar(), _settings()],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: cites.length,
                  itemBuilder: (context, index) {
                    final city = cites[index];
                    final porcentaje = (page - index).abs().clamp(0.0, 1.0);
                    final factor =
                        _pageController.position.userScrollDirection ==
                                ScrollDirection.forward
                            ? 1.0
                            : -1.0;
                    return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(vector.radians(45 * factor * porcentaje)),
                        child: Opacity(
                            opacity: (1 - porcentaje.clamp(0.0, 0.7)),
                            child: CityItemWidget(
                              city: city,
                              onSwipe: () {
                                print('hola');
                                _onswipe(city);
                              },
                            )));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  IconButton _settings() {
    return IconButton(
        onPressed: () => print('hola'), icon: Icon(Icons.settings));
  }

  Expanded _btnbuscar() {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Icon(Icons.search),
            Expanded(
              child: Text('Buscar Ciudades'),
            )
          ]),
        ),
      ),
    );
  }

  void _listener() {
    setState(() {
      page = _pageController.page as double;
    });
  }
}
