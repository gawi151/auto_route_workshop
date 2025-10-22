import 'package:auto_route_workshop/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../models/models.dart';

/// Lesson 2: Named Routes & Parameters
/// This screen demonstrates:
/// - Display a list of items
/// - Navigate with parameters to show details
/// - Using named routes
@RoutePage()
class Lesson2ProductsScreen extends StatelessWidget {
  const Lesson2ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 2: Named Routes & Parameters'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Products',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Click on a product to see its details. '
                    'Notice how we pass data between screens using parameters.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...Product.mockProducts.map((product) {
            return ProductCard(
              product: product,
              onTap: () {
                // TODO: Navigate to Lesson2ProductDetailScreen with product parameter
                // Hint: Use context.router.push() or a named route
                // Pass the product as a parameter
                context.router.push(
                  Lesson2ProductDetailRoute(product: product),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

/// Reusable Product Card Widget
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.shopping_bag),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.green),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward, color: Colors.grey.shade400),
            ],
          ),
        ),
      ),
    );
  }
}
