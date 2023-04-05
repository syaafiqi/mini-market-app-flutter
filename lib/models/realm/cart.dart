import 'package:realm/realm.dart';

part 'cart.g.dart';

@RealmModel()
class _Cart {
  @PrimaryKey()
  late int id;
  late String title;
  late String description;
  late double price;
  double? discountPercentage;
  double? rating;
  late int qty;
  late String brand;
  late String category;
  late String? thumbnail;
}
