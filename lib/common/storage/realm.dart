import 'package:mini_market_app/models/realm/cart.dart';
import 'package:realm/realm.dart';

abstract class RealmInstance {
  static final Configuration _configuration = Configuration.local(
    [
      // Add schemas here
      Cart.schema,
    ],
    shouldDeleteIfMigrationNeeded: true,
  );

  static Realm open() => Realm(_configuration);
}
