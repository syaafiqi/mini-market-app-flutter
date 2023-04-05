import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mini_market_app/modules/home/home_binding.dart';
import 'package:mini_market_app/modules/home/home_view.dart';
import 'package:mini_market_app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Market App',
      home: const HomeView(),
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
