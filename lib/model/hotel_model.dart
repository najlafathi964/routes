class HotelModel {
  int? id;
  String? name;
  String? location;
  String? info;
  String? price;
  String? image;
  bool isFav;
  bool isBooked;

  HotelModel(
      {this.id,
      this.name,
      this.location,
      this.info,
      this.price,
      this.image,
      this.isFav = false,
      this.isBooked = false});
}
