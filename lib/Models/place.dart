class City {
  final String? name;
  final String? price;
  final String? place;
  final String? date;
  final String? image;
  final List<CityReviews> reviews;

  const City(
      {this.name,
      this.price,
      this.place,
      this.date,
      this.image,
      required this.reviews});
}

class CityReviews {
  final String? avatar;
  final DateTime? date;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? image;
  const CityReviews(
      {this.avatar,
      this.date,
      this.title,
      this.subtitle,
      this.description,
      this.image});
}

final cites = <City>[
  City(
      name: 'Colombia',
      price: '12500',
      place: 'Barranquilla',
      date: '2023/04/28',
      image: 'assets/paises/barranquilla.jpg',
      reviews: [
        CityReviews(
          avatar: 'assets/avatar/img1.jpg',
          date: DateTime(2023, 4, 28, 7, 0, 0),
          title: 'titulo 1',
          subtitle: 'Subtitulo 1',
          image: 'assets/paises/1.jpg',
          description:
              'Esta es una descripción de la puerta de oro de Colombia',
        )
      ]),
  City(
      name: 'Colombia',
      price: '10500',
      place: 'Medellin',
      date: '2023/04/28',
      image: 'assets/paises/medellin.jpg',
      reviews: [
        CityReviews(
          avatar: 'assets/avatar/img2.jpg',
          date: DateTime(2023, 4, 29, 7, 0, 0),
          title: 'titulo 2',
          subtitle: 'Subtitulo 2',
          image: 'assets/paises/2.jpg',
          description: 'Esta es una descripción de la ciudad de Medellin',
        )
      ]),
];
