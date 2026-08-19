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
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff8B451F),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String unit;

  const Product(this.name, this.price, this.unit);
}

const sweets = [
  Product('Ghewar', '650', '/ Kg'),
  Product('Rasmalai', '480', '/ Kg'),
  Product('Gulab Jamun', '280', '/ Kg'),
  Product('Malaichap', '400', '/ Kg'),
  Product('Cham-Cham', '400', '/ Kg'),
  Product('Rajbhog', '30', '/ Piece'),
  Product('Chena', '240', '/ Kg'),
  Product('Rabdi', '400', '/ Kg'),
  Product('Malaria', '400', '/ Kg'),
  Product('Dhoodh Barfi', '400', '/ Kg'),
  Product('Milk Cake', '480', '/ Kg'),
  Product('Besan Barfi', '300', '/ Kg'),
  Product('Boondi Laddu', '240', '/ Kg'),
  Product('Balusahi', '240', '/ Kg'),
  Product('Magaj Laddu', '200', '/ Kg'),
  Product('Lal Peda', '360', '/ Kg'),
  Product('White Peda', '380', '/ Kg'),
];

const snacks = [
  Product('Namkeen', '240', '/ Kg'),
  Product('Samosa', '10', '/ Piece'),
  Product('Kachori', '15', '/ Piece'),
  Product('Aloo Bonda', '10', '/ Piece'),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cartCount = 0;
  int selectedTab = 0;

  void addToCart() {
    setState(() {
      cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF9F1),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFF9F1),
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: const [
            Text(
              'ॐ',
              style: TextStyle(
                color: Color(0xffD97706),
                fontSize: 25,
              ),
            ),
            Text(
              'Sai Ram',
              style: TextStyle(
                color: Color(0xff6B2F18),
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'HOTEL & SWEETS',
              style: TextStyle(
                color: Color(0xff6B2F18),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xff6B2F18),
                  size: 28,
                ),
                onPressed: () {},
              ),
              if (cartCount > 0)
                Positioned(
                  right: 4,
                  top: 3,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.red,
                    child: Text(
                      '$cartCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff6B2F18),
              ),
              child: Center(
                child: Text(
                  'Sai Ram\nHotel & Sweets',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text('Sweets'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.fastfood),
              title: const Text('Nasta'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Location'),
              subtitle: const Text(
                'Lakhnadon Rest House ke Samne Petrol Pump',
              ),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Call Shop'),
              subtitle: const Text('8839796889'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(22),
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffffead0),
                    Color(0xfffff4e4),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Pure Taste',
                          style: TextStyle(
                            color: Color(0xffA0522D),
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'PURE SWEETS',
                          style: TextStyle(
                            color: Color(0xff6B2F18),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'PURE HAPPINESS',
                          style: TextStyle(
                            color: Color(0xffD97706),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Premium Quality • Pure Ingredients',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      color: const Color(0xffffd9a8),
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: const Icon(
                      Icons.cake,
                      size: 75,
                      color: Color(0xff8B451F),
                    ),
                  ),
                ],
              ),
            ),

            // Features
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Feature(icon: Icons.delivery_dining, title: 'Fast Delivery'),
                  Feature(icon: Icons.verified, title: 'Pure & Fresh'),
                  Feature(icon: Icons.local_offer, title: 'Best Offers'),
                  Feature(icon: Icons.shield, title: 'Hygienic'),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Categories
            const SectionTitle(title: 'Shop by Category'),

            Row(
              children: [
                CategoryCard(
                  icon: Icons.cake,
                  title: 'Sweets',
                  onTap: () {},
                ),
                CategoryCard(
                  icon: Icons.restaurant,
                  title: 'Hotel / Food',
                  onTap: () {},
                ),
                CategoryCard(
                  icon: Icons.fastfood,
                  title: 'Namkeen',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Today's Special
            const SectionTitle(title: "Today's Special"),

            ProductCard(
              product: sweets[0],
              special: true,
              onAdd: addToCart,
            ),

            const SizedBox(height: 20),

            const SectionTitle(title: 'Popular Sweets'),

            ...sweets.skip(1).take(6).map(
                  (product) => ProductCard(
                    product: product,
                    onAdd: addToCart,
                  ),
                ),

            const SizedBox(height: 20),

            const SectionTitle(title: 'Nasta'),

            ...snacks.map(
              (product) => ProductCard(
                product: product,
                onAdd: addToCart,
              ),
            ),

            const SizedBox(height: 30),

            // Address
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xff6B2F18),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 35,
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
                    'Lakhnadon Rest House ke Samne Petrol Pump',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '📞 8839796889',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(Icons.grid_view),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: cartCount > 0,
              label: Text('$cartCount'),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            label: 'Cart',
          ),
          const NavigationDestination(
            icon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class Feature extends StatelessWidget {
  final IconData icon;
  final String title;

  const Feature({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xffffedda),
          child: Icon(
            icon,
            color: const Color(0xff8B451F),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

 
