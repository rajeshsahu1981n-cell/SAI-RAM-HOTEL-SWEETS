import 'package:flutter/material.dart';

void main() {
  runApp(const SaiRamApp());
}

class SaiRamApp extends StatelessWidget {
  const SaiRamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sai Ram Hotel & Sweets',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B351A),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class Product {
  final String name;
  final int price;
  final String unit;
  final IconData icon;

  const Product({
    required this.name,
    required this.price,
    required this.unit,
    required this.icon,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cartCount = 0;

  final List<Product> products = const [
    Product(
      name: 'Ghewar',
      price: 650,
      unit: 'kg',
      icon: Icons.circle,
    ),
    Product(
      name: 'Rasmalai',
      price: 480,
      unit: 'kg',
      icon: Icons.icecream,
    ),
    Product(
      name: 'Gulab Jamun',
      price: 280,
      unit: 'kg',
      icon: Icons.cookie,
    ),
    Product(
      name: 'Malaichap',
      price: 400,
      unit: 'kg',
      icon: Icons.circle,
    ),
    Product(
      name: 'Cham-Cham',
      price: 400,
      unit: 'kg',
      icon: Icons.cookie,
    ),
    Product(
      name: 'Rajbhog',
      price: 30,
      unit: 'piece',
      icon: Icons.brightness_1,
    ),
    Product(
      name: 'Chena',
      price: 240,
      unit: 'kg',
      icon: Icons.circle,
    ),
    Product(
      name: 'Rabdi',
      price: 400,
      unit: 'kg',
      icon: Icons.icecream,
    ),
    Product(
      name: 'Dhoodh Barfi',
      price: 400,
      unit: 'kg',
      icon: Icons.square,
    ),
    Product(
      name: 'Milk Cake',
      price: 480,
      unit: 'kg',
      icon: Icons.square,
    ),
    Product(
      name: 'Besan Barfi',
      price: 300,
      unit: 'kg',
      icon: Icons.square,
    ),
    Product(
      name: 'Boondi Laddu',
      price: 240,
      unit: 'kg',
      icon: Icons.brightness_1,
    ),
    Product(
      name: 'Balusahi',
      price: 240,
      unit: 'kg',
      icon: Icons.circle,
    ),
    Product(
      name: 'Magaj Laddu',
      price: 200,
      unit: 'kg',
      icon: Icons.brightness_1,
    ),
    Product(
      name: 'Lal Peda',
      price: 360,
      unit: 'kg',
      icon: Icons.circle,
    ),
    Product(
      name: 'White Peda',
      price: 380,
      unit: 'kg',
      icon: Icons.circle,
    ),
    Product(
      name: 'Namkeen',
      price: 240,
      unit: 'kg',
      icon: Icons.fastfood,
    ),
    Product(
      name: 'Samosa',
      price: 10,
      unit: 'piece',
      icon: Icons.fastfood,
    ),
    Product(
      name: 'Kachori',
      price: 15,
      unit: 'piece',
      icon: Icons.fastfood,
    ),
    Product(
      name: 'Aloo Bonda',
      price: 10,
      unit: 'piece',
      icon: Icons.fastfood,
    ),
  ];

  void addToCart(Product product) {
    setState(() {
      cartCount++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} cart me add ho gaya'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6B351A),
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sai Ram',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'HOTEL & SWEETS',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Cart me $cartCount items hain',
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
              if (cartCount > 0)
                Positioned(
                  right: 5,
                  top: 5,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.orange,
                    child: Text(
                      '$cartCount',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFFF0D3B5),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'स्वाद जो याद रह जाए ❤️',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF54250F),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Fresh sweets • Pure ingredients • Best taste',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B351A),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const SectionTitle(
              title: 'Shop by Category',
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 105,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(
                    title: 'Sweets',
                    icon: Icons.cake_outlined,
                  ),
                  CategoryCard(
                    title: 'Namkeen',
                    icon: Icons.fastfood_outlined,
                  ),
                  CategoryCard(
                    title: 'Nasta',
                    icon: Icons.restaurant_outlined,
                  ),
                  CategoryCard(
                    title: 'Special',
                    icon: Icons.star_outline,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const SectionTitle(
              title: "Today's Special",
            ),

            const SizedBox(height: 12),

            ProductCard(
              product: products[0],
              special: true,
              onAdd: () => addToCart(products[0]),
            ),

            const SizedBox(height: 25),

            const SectionTitle(
              title: 'Popular Sweets',
            ),

            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.74,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onAdd: () => addToCart(products[index]),
                );
              },
            ),

            const SizedBox(height: 25),

            // Contact
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF6B351A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.storefront,
                    color: Colors.white,
                    size: 38,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sai Ram Hotel & Sweets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '📍 Lakhnadon Rest House ke Samne Petrol Pump',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '📞 8839796889',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: 
      BottomNavigationBar(
        
        currentIndex: 0,
        selectedItemColor: Color(0xFF6B351A),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ================= SECTION TITLE =================

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF54250F),
          ),
        ),
        const Icon(
          Icons.arrow_forward,
          color: Color(0xFF6B351A),
        ),
      ],
    );
  }
}

// ================= CATEGORY CARD =================

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE7D4C2),
        ),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 34,
            color: const Color(0xFF6B351A),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ================= PRODUCT CARD =================

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;
  final bool special;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAdd,
    this.special = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE7D4C2),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF3E0CB),
                borderRadius:
                    BorderRadius.circular(15),
              ),
              child: Center(
                child: Icon(
                  product.icon,
                  size: special ? 75 : 55,
                  color: const Color(0xFF8B451F),
                ),
              ),
            ),
          ),

          const SizedBox(height: 9),

          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF54250F),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            '₹${product.price}/${product.unit}',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF8B451F),
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 7),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onAdd,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF6B351A),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(
                  vertical: 9,
                ),
                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                ),
              ),
              child: const Text('ADD'),
            ),
          ),
        ],
      ),
    );
  }
}
