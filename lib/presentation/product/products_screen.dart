import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_bloc/presentation/product/bloc/products_cubit.dart';
import 'package:freezed_bloc/presentation/product/bloc/products_state.dart';
import 'package:freezed_bloc/presentation/product/widget/product_item_card.dart';
import 'package:freezed_bloc/presentation/update_product/cubit/product_update_cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<ProductUpdateCubit>().updateProduct(id: );
        },
      ),
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          Widget? view;
          view = state.whenOrNull(
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
                return GestureDetector(
                    onTap: () {
                      context.read<ProductUpdateCubit>().updateProduct(
                          id: item.id ?? 0, title: 'Test ${item.id}');
                    },
                    child: ProductItemCard(item: item));
              },
            ),
            failure: (e) => Center(
              child: Text(e),
            ),
          );

          return view ?? Container();
        },
      ),
    );
  }
}
