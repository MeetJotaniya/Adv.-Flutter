class ProductModel {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  // final double rating;
  final int reviews;
  final bool isPrime;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    // required this.rating,
    required this.reviews,
    required this.isPrime,
  });

  static List<ProductModel> getProducts() {
    return [
      ProductModel(
        name: 'Apple 2025 MacBook Air ',
        description: '13-inch, Apple M4 chip with 10-core CPU and 8-core GPU, 16GB Unified Memory, 256GB',
        price: 91990,
        imageUrl:
        'https://m.media-amazon.com/images/I/71pKJ+Mjd8L._SL1500_.jpg',
        // rating: 4.8,
        reviews: 2364,
        isPrime: true,
      ),
      ProductModel(
        name: 'iQOO 13 5G ',
        description: 'Legend, 12GB RAM, 256GB Storage',
        price: 54999.99,
        imageUrl:
        'https://m.media-amazon.com/images/I/41LBUHSUteL._SX300_SY300_QL70_FMwebp_.jpg',
        // rating: 4.4,
        reviews: 1471,
        isPrime: true,
      ),
      ProductModel(
        name: 'Apple AirPods Pro (2nd Generation)',
        description: 'Active Noise Cancelling Earbuds',
        price: 249.99,
        imageUrl:
        'https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_UY218_.jpg',
        // rating: 4.8,
        reviews: 45672,
        isPrime: true,
      ),
      ProductModel(
        name: 'Apple Watch Series 9',
        description: 'GPS 45mm Smart Watch',
        price: 399.99,
        imageUrl: 'https://m.media-amazon.com/images/I/71TMn2dnDyL.jpg',
        // rating: 4.6,
        reviews: 3421,
        isPrime: true,
      ),
    ];
  }
}