import 'package:dio/dio.dart';
import 'package:mini_market_app/common/constants.dart';

class ProductApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));

  Future<dynamic> getProducts() async {
    final response = await dio.get('products');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<dynamic> getProductDetail({required int id}) async {
    final response = await dio.get('products/$id');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
