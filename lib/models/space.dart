class Space {
  late int id;
  late String name;
  late int price;
  late String city;
  late String country;
  late String imageUrl;
  late int rating;
  late String address;
  late String phone;
  late String mapUrl;
  late List photos;
  late int numberOfKitchens;
  late int numberOfBedrooms;
  late int numberOfCupboards;

  Space(
      {required this.id,
      required this.name,
      required this.price,
      required this.city,
      required this.country,
      required this.imageUrl,
      required this.rating,
      required this.address,
      required this.mapUrl,
      required this.phone,
      required this.photos,
      required this.numberOfKitchens,
      required this.numberOfBedrooms,
      required this.numberOfCupboards});

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    photos = json['photos'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    numberOfKitchens = json['number_of_kitchens'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
  }
}
