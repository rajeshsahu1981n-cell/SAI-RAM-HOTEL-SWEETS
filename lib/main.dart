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
        fontFamily: 'sans',
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
        elevation: 0,
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
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
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
                    SizedBox(height:
