class CartModel {
  int id;
  String title;
  String description;
  double price;
  double? discountPercentage;
  double? rating;
  int qty;
  String brand;
  String category;
  String? thumbnail;

  CartModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.discountPercentage,
    this.rating,
    required this.qty,
    required this.brand,
    required this.category,
    this.thumbnail,
  });
}
