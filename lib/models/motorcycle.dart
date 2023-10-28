class Motorcycle {
  String merk;
  String brand;
  String image;
  int year;
  double price;
  bool isAvailable;
  String description;

  Motorcycle(this.merk, this.brand, this.image, this.year, this.price,
      this.isAvailable, this.description);

  List<Motorcycle> getFiveBestMotocycle(List<Motorcycle> list) {
    return list.sublist(0, 5);
  }
}
