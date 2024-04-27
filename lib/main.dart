import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_bloc/common/custom_bloc_observer.dart';
import 'package:freezed_bloc/di/injection_service.dart';
import 'package:freezed_bloc/presentation/product/products_screen.dart';

void main() async {
  Bloc.observer = const CustomBlocObserver();
  await InjectionService.config();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductsScreen(),
    );
  }
}
