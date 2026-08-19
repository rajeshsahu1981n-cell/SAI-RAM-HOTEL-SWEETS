import 'package:flutter/material.dart';

void main() {
  runApp(const SaiRamHotelApp());
}

class SaiRamHotelApp extends StatelessWidget {
  const SaiRamHotelApp({super.key});

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cartCount = 0;

  final List<Product> products = [
    Product(
      name: 'Ghewar',
      price: 650,
      unit: 'kg',
      icon: Icons.circle,
    ),
    Product(
      name: 'Kaju Katli',
      price: 900,
      unit: 'kg',
      icon: Icons.diamond,
    ),
    Product(
      name: 'Gulab Jamun',
      price: 400,
      unit: 'kg',
      icon: Icons.cookie,
    ),
    Product(
      name: 'Rasgulla',
      price: 350,
      unit: 'kg',
      icon: Icons.egg,
    ),
    Product(
      name: 'Motichoor Laddu',
      price: 500,
      unit: 'kg',
      icon: Icons.brightness_1,
    ),
    Product(
      name: 'Milk Cake',
      price: 550,
      unit: 'kg',
      icon: Icons.square,
    ),
  ];

  void addToCart() {
    setState(() {
      cartCount++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item cart me add ho gaya'),
        duration: Duration(seconds: 1),
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
              'Hotel & Sweets',
              style: TextStyle(fontSize: 13),
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
                        cartCount == 0
                            ? 'Cart abhi empty hai'
                            : 'Cart me $cartCount items hain',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
              if (cartCount > 0)
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$cartCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Banner
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
                      'Fresh sweets made with love',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF6B351A),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Categories
              const SectionTitle(title: 'Shop by Category'),

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
                      title: 'Bakery',
                      icon: Icons.bakery_dining_outlined,
                    ),
                    CategoryCard(
                      title: 'Drinks',
                      icon: Icons.local_drink_outlined,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Today's Special
              const SectionTitle(title: "Today's Special"),

              const SizedBox(height: 12),

              ProductCard(
                product: products[0],
                onAdd: addToCart,
              ),

              const SizedBox(height: 25),

              // Popular Sweets
              const SectionTitle(title: 'Popular Sweets'),

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
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                    onAdd: addToCart,
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
                      size: 40,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sai Ram Hotel & Sweets',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Fresh • Quality • Delicious',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- SECTION TITLE ----------------

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

// ---------------- CATEGORY CARD ----------------

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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.10),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 34,
            color: const Color(0xFF6B351A),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- PRODUCT CARD ----------------
