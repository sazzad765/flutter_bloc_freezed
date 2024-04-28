import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_bloc/presentation/product/bloc/products_cubit.dart';
import 'package:freezed_bloc/presentation/product/bloc/products_state.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsCubit()..fetchProduct(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${item.thumbnail}'),
                        fit: BoxFit.fill,
                        opacity: .1,
                      ),
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          item.title ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          item.description ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$${item.price}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              failure: (e) => Center(
                child: Text(e),
              ),
            );
          },
        ),
      ),
    );
  }
}
