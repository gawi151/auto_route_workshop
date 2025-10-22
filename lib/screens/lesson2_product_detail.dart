import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../models/models.dart';

/// Lesson 2: Product Detail Screen
/// This screen demonstrates:
/// - Receiving parameters from the previous screen
/// - Type-safe parameter passing with auto_route
@RoutePage()
class Lesson2ProductDetailScreen extends StatelessWidget {
  final Product product;

  const Lesson2ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.shopping_bag, size: 64),
          ),
          const SizedBox(height: 24),
          Text(product.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text('Description', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(product.description),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Added to cart!')));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Add to Cart'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {
              // TODO: Navigate to another product
              // Challenge: Try navigating to a different product without adding another stack
              // Hint: Use context.router.replace() instead of push()
              // final nextProduct = Product.nextProduct(product); (pass this to new screen)
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('View Another Product'),
          ),
        ],
      ),
    );
  }
}
