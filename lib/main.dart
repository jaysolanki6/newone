import 'package:flutter/material.dart';

void main() {
  runApp(const SwiftShopApp());
}

class SwiftShopApp extends StatelessWidget {
  const SwiftShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SwiftShop E-commerce1122t211',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });
}

final List<Product> dummyProducts = [
  Product(id: 1, name: 'Premium Headphones', price: 299.99, image: 'https://picsum.photos/id/1/300/300', category: 'Electronics'),
  Product(id: 2, name: 'Leather Wallet', price: 49.50, image: 'https://picsum.photos/id/2/300/300', category: 'Accessories'),
  Product(id: 3, name: 'Smart Watch', price: 199.00, image: 'https://picsum.photos/id/20/300/300', category: 'Electronics'),
  Product(id: 4, name: 'Running Shoes', price: 89.99, image: 'https://picsum.photos/id/10/300/300', category: 'Footwear'),
  Product(id: 5, name: 'Cotton T-Shirt', price: 25.00, image: 'https://picsum.photos/id/15/300/300', category: 'Apparel'),
  Product(id: 6, name: 'Coffee Mug', price: 12.99, image: 'https://picsum.photos/id/30/300/300', category: 'Home'),
  Product(id: 7, name: 'Backpack', price: 75.00, image: 'https://picsum.photos/id/37/300/300', category: 'Accessories'),
  Product(id: 8, name: 'Sunglasses', price: 120.00, image: 'https://picsum.photos/id/64/300/300', category: 'Accessories'),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cartCount = 0;

  void _addToCart() {
    setState(() {
      _cartCount++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item added to cart!'),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    // Logic for responsiveness
    int crossAxisCount;
    double padding;
    if (width > 1200) {
      crossAxisCount = 5;
      padding = 60.0;
    } else if (width > 900) {
      crossAxisCount = 4;
      padding = 40.0;
    } else if (width > 600) {
      crossAxisCount = 2;
      padding = 20.0;
    } else {
      crossAxisCount = 1;
      padding = 16.0;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('SwiftShop', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: width < 600,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          if (width > 600) ...[
            TextButton(onPressed: () {}, child: const Text('Home')),
            TextButton(onPressed: () {}, child: const Text('Products')),
            TextButton(onPressed: () {}, child: const Text('About')),
          ],
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              if (_cartCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '$_cartCount',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: width < 600
          ? Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
                    child: const Text('SwiftShop Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                  const ListTile(leading: Icon(Icons.home), title: Text('Home')),
                  const ListTile(leading: Icon(Icons.category), title: Text('Categories')),
                  const ListTile(leading: Icon(Icons.favorite), title: Text('Wishlist')),
                  const ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner
            Container(
              width: double.infinity,
              height: width > 600 ? 300 : 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.blue.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Modern E-commerce Solution',
                        textAlign: TextAlign.center,
                        style: (width > 600 ? Theme.of(context).textTheme.headlineLarge : Theme.of(context).textTheme.headlineMedium)
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Responsive design for Web, iOS, and Android',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.indigo,
                        ),
                        child: const Text('Shop Now'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: 30),
              child: Text(
                'Featured Products',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),

            // Responsive Product Grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemCount: dummyProducts.length,
                itemBuilder: (context, index) {
                  final product = dummyProducts[index];
                  return ProductCard(product: product, onAdd: _addToCart);
                },
              ),
            ),
            const SizedBox(height: 60),
            
            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey.shade100,
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const Text('© 2023 SwiftShop. All rights reserved.'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Privacy Policy')),
                      TextButton(onPressed: () {}, child: const Text('Terms of Service')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: width < 600 
        ? BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
            ],
          )
        : null,
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const ProductCard({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (c, e, s) => Container(
                      color: Colors.grey.shade200,
                      child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border, size: 18, color: Colors.red),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.toUpperCase(),
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: onAdd,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          minimumSize: const Size(0, 32),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
