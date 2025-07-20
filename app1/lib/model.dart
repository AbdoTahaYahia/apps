class Categorymodel {
  final String name;
  final String image;
  Categorymodel({required this.name, required this.image});
}

class Productmodel {
  final String name;
  final String image;
  final String price;
  final String rate;
  final String ratecount;
  Productmodel({
    required this.name,
    required this.image,
    required this.price,
    required this.rate,
    required this.ratecount,
  });
}
