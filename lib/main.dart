// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laundromat_flutter/config/router/router.dart';
import 'package:laundromat_flutter/config/theme/theme.dart';
import 'package:laundromat_flutter/model/favpoke_model.dart';
import 'package:laundromat_flutter/service/auth/auth_service.dart';

// Future<void> main() async {
//   final authService = Get.put(AuthService());
//   final router = AppRouter(authService).router;

//   // ต้องเริ่มต้น Hive ก่อนใช้งาน
//   await Hive.initFlutter();

//   // เปิด box - box คือที่เก็บข้อมูลคล้าย collection
//   await Hive.openBox('favPoke');

//   runApp(MyApp(router: router));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authService = Get.put(AuthService());
  final router = AppRouter(authService).router;

  // Initialize Hive
  await Hive.initFlutter();

  // Register Adapter
  if (!Hive.isAdapterRegistered(FavpokeModelAdapter().typeId)) {
    Hive.registerAdapter(FavpokeModelAdapter());
  }

  // Open the box once
  // await Hive.openBox<FavpokeModel>('favpoke');

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Auth Demo',
      theme: appTheme(),
    );
  }
}
