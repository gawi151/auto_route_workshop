/// Lesson 2: Named routes & parameters
/// This model is used in the Products lesson to demonstrate
/// how to pass data between screens
class Product {
  final int id;
  final String name;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  // Mock data for the workshop
  static List<Product> mockProducts = [
    Product(
      id: 1,
      name: 'Smartphone',
      description: 'High-end smartphone with great camera',
      price: 999.99,
    ),
    Product(
      id: 2,
      name: 'Laptop',
      description: 'Powerful laptop for development',
      price: 1599.99,
    ),
    Product(
      id: 3,
      name: 'Tablet',
      description: 'Perfect for reading and browsing',
      price: 499.99,
    ),
    Product(
      id: 4,
      name: 'Headphones',
      description: 'Wireless headphones with great sound',
      price: 299.99,
    ),
  ];

  static Product nextProduct(Product currentProduct) {
    final products = Product.mockProducts;
    final currentProductIndex = products.indexOf(currentProduct);
    final nextProductIndex = (currentProductIndex + 1) % products.length;
    return products[nextProductIndex];
  }
}
