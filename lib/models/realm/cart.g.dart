// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Cart extends _Cart with RealmEntity, RealmObjectBase, RealmObject {
  Cart(
    int id,
    String title,
    String description,
    double price,
    int qty,
    String brand,
    String category, {
    double? discountPercentage,
    double? rating,
    String? thumbnail,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'discountPercentage', discountPercentage);
    RealmObjectBase.set(this, 'rating', rating);
    RealmObjectBase.set(this, 'qty', qty);
    RealmObjectBase.set(this, 'brand', brand);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'thumbnail', thumbnail);
  }

  Cart._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  double? get discountPercentage =>
      RealmObjectBase.get<double>(this, 'discountPercentage') as double?;
  @override
  set discountPercentage(double? value) =>
      RealmObjectBase.set(this, 'discountPercentage', value);

  @override
  double? get rating => RealmObjectBase.get<double>(this, 'rating') as double?;
  @override
  set rating(double? value) => RealmObjectBase.set(this, 'rating', value);

  @override
  int get qty => RealmObjectBase.get<int>(this, 'qty') as int;
  @override
  set qty(int value) => RealmObjectBase.set(this, 'qty', value);

  @override
  String get brand => RealmObjectBase.get<String>(this, 'brand') as String;
  @override
  set brand(String value) => RealmObjectBase.set(this, 'brand', value);

  @override
  String get category =>
      RealmObjectBase.get<String>(this, 'category') as String;
  @override
  set category(String value) => RealmObjectBase.set(this, 'category', value);

  @override
  String? get thumbnail =>
      RealmObjectBase.get<String>(this, 'thumbnail') as String?;
  @override
  set thumbnail(String? value) => RealmObjectBase.set(this, 'thumbnail', value);

  @override
  Stream<RealmObjectChanges<Cart>> get changes =>
      RealmObjectBase.getChanges<Cart>(this);

  @override
  Cart freeze() => RealmObjectBase.freezeObject<Cart>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Cart._);
    return const SchemaObject(ObjectType.realmObject, Cart, 'Cart', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.double),
      SchemaProperty('discountPercentage', RealmPropertyType.double,
          optional: true),
      SchemaProperty('rating', RealmPropertyType.double, optional: true),
      SchemaProperty('qty', RealmPropertyType.int),
      SchemaProperty('brand', RealmPropertyType.string),
      SchemaProperty('category', RealmPropertyType.string),
      SchemaProperty('thumbnail', RealmPropertyType.string, optional: true),
    ]);
  }
}
