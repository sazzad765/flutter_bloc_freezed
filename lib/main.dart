import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_bloc/common/custom_bloc_observer.dart';
import 'package:freezed_bloc/di/injection_service.dart';
import 'package:freezed_bloc/presentation/product/bloc/products_cubit.dart';
import 'package:freezed_bloc/presentation/product/products_screen.dart';
import 'package:freezed_bloc/presentation/update_product/cubit/product_update_cubit.dart';

void main() async {
  Bloc.observer = const CustomBlocObserver();
  await InjectionService.config();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductsCubit()..fetchProduct(),
        ),
        BlocProvider<ProductUpdateCubit>(
          create: (_) => ProductUpdateCubit(
            productsCubit: context.read<ProductsCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ProductsScreen(),
      ),
    );
  }
}
