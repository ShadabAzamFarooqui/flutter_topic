import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/pointers_view.dart';

class SelectWithFamilyAndAutoDispose extends StatelessWidget {
  const SelectWithFamilyAndAutoDispose({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'select with family and autoDispose',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'select with family and autoDispose'),

          CodeView(
            code: '''final productProvider =
    StateNotifierProvider
        .autoDispose
        .family<

        ProductNotifier,

        ProductState,

        int > ((ref, productId) {
          final api =
          ref.read(apiServiceProvider);

          return ProductNotifier(
            api,
            productId,
          );
        });''',
          ),

          PointersView(text: 'UI Usage'),
          CodeView(
            code: '''class ProductScreen
    extends ConsumerWidget {

  final int productId;

  const ProductScreen({

    super.key,

    required this.productId,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final state =
        ref.watch(
          productProvider(productId),
        );

    if (state.isLoading) {

      return const Center(
        child:
            CircularProgressIndicator(),
      );
    }

    if (state.errorMessage != null) {

      return Center(
        child:
            Text(state.errorMessage!),
      );
    }

    if (state.product == null) {

      return const Center(
        child:
            Text("No Product Found"),
      );
    }

    return Column(

      children: [

        /// PRODUCT NAME
        Consumer(

          builder: (
            context,
            ref,
            child,
          ) {

            final productName =

                ref.watch(

                  productProvider(productId)
                      .select(

                    (state) =>
                        state.product?.name,
                  ),
                );

            print("Name Rebuilt");

            return Text(
              productName ?? "",
            );
          },
        ),

        /// PRODUCT PRICE
        Consumer(

          builder: (
            context,
            ref,
            child,
          ) {

            final productPrice =

                ref.watch(

                  productProvider(productId)
                      .select(

                    (state) =>
                        state.product?.price,
                  ),
                );

            print("Price Rebuilt");

            return Text(
              "\$productPrice",
            );
          },
        ),

        /// STOCK STATUS
        Consumer(

          builder: (
            context,
            ref,
            child,
          ) {

            final inStock =

                ref.watch(

                  productProvider(productId)
                      .select(

                    (state) =>
                        state.product?.inStock,
                  ),
                );

            print("Stock Rebuilt");

            return Text(

              inStock == true

                  ? "In Stock"

                  : "Out Of Stock",
            );
          },
        ),
      ],
    );
  }
}''',
          ),
        ],
      ),
    );
  }
}
