import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const SaiRamApp());
}

// =====================================================
// APP
// =====================================================

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

// =====================================================
// PRODUCT
// =====================================================

class Product {
  final String name;
  final int price;
  final String unit;
  final String category;
  final String imageUrl;

  const Product({
    required this.name,
    required this.price,
    required this.unit,
    required this.category,
    required this.imageUrl,
  });
}

// =====================================================
// CART
// =====================================================

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  int get total => product.price * quantity;
}

// =====================================================
// HOME PAGE
// =====================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Sweets';

  final List<CartItem> cart = [];

  // ===================================================
  // PRODUCTS
  // ===================================================

  final List<Product> products = const [

    // ---------------- SWEETS ----------------

    Product(
      name: 'Ghewar',
      price: 650,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Rasmalai',
      price: 480,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1575377427642-087cf684f29d?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Gulab Jamun',
      price: 280,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1666190094767-3c7e4d8f7a8a?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Malaichap',
      price: 400,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Cham-Cham',
      price: 400,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Rajbhog',
      price: 30,
      unit: 'piece',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1589119908995-c6837fa14848?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Chena',
      price: 240,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Rabdi',
      price: 400,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Malai',
      price: 400,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1571115177098-24ec42ed204d?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Dhoodh Barfi',
      price: 400,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Milk Cake',
      price: 480,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1606312619070-d48b4c652a52?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Besan Barfi',
      price: 300,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1587314168485-3236d6710814?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Boondi Laddu',
      price: 240,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1606471191009-63994c53433b?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Balusahi',
      price: 240,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1599785209707-a456fc1337bb?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Magaj Laddu',
      price: 200,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Lal Peda',
      price: 360,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1607920592519-0c7e1c8c8c4c?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'White Peda',
      price: 380,
      unit: 'kg',
      category: 'Sweets',
      imageUrl:
          'https://images.unsplash.com/photo-1599599810769-bcde5a160d32?auto=format&fit=crop&w=600&q=80',
    ),

    // ---------------- NAMKEEN ----------------

    Product(
      name: 'Namkeen',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      imageUrl:
          'https://images.unsplash.com/photo-1599599810694-57a3e0e4a3f0?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Dalmoth',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      imageUrl:
          'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Mixture',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      imageUrl:
          'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Farali Namkeen',
      price: 280,
      unit: 'kg',
      category: 'Namkeen',
      imageUrl:
          'https://images.unsplash.com/photo-1627662168804-7e8c2f1b1f1d?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Sev',
      price: 200,
      unit: 'kg',
      category: 'Namkeen',
      imageUrl:
          'https://images.unsplash.com/photo-1627662168804-7e8c2f1b1f1d?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Chiwda Namkeen',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      imageUrl:
          'https://images.unsplash.com/photo-1599599810769-bcde5a160d32?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Logsev',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      imageUrl:
          'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Katha Metha',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      imageUrl:
          'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=600&q=80',
    ),

    // ---------------- NASTA ----------------

    Product(
      name: 'Samosa',
      price: 10,
      unit: 'piece',
      category: 'Nasta',
      imageUrl:
          'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Kachori',
      price: 15,
      unit: 'piece',
      category: 'Nasta',
      imageUrl:
          'https://images.unsplash.com/photo-1628294895950-9805252327bc?auto=format&fit=crop&w=600&q=80',
    ),

    Product(
      name: 'Aloo Bonda',
      price: 10,
      unit: 'piece',
      category: 'Nasta',
      imageUrl:
          'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?auto=format&fit=crop&w=600&q=80',
    ),
  ];

  // ===================================================
  // GETTERS
  // ===================================================

  List<Product> get filteredProducts {
    return products
        .where(
          (product) =>
              product.category == selectedCategory,
        )
        .toList();
  }

  int get cartCount {
    return cart.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
  }

  int get grandTotal {
    return cart.fold(
      0,
      (sum, item) => sum + item.total,
    );
  }

  // ===================================================
  // ADD TO CART
  // ===================================================

  void addToCart(Product product) {
    setState(() {
      final index = cart.indexWhere(
        (item) =>
            item.product.name == product.name,
      );

      if (index >= 0) {
        cart[index].quantity++;
      } else {
        cart.add(
          CartItem(product: product),
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${product.name} cart me add ho gaya',
        ),
        duration:
            const Duration(milliseconds: 700),
      ),
    );
  }

  void plus(int index) {
    setState(() {
      cart[index].quantity++;
    });
  }

  void minus(int index) {
    setState(() {
      cart[index].quantity--;

      if (cart[index].quantity <= 0) {
        cart.removeAt(index);
      }
    });
  }

  void deleteItem(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  // ===================================================
  // WHATSAPP
  // ===================================================

  Future<void> sendWhatsApp() async {
    if (cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cart empty hai'),
        ),
      );
      return;
    }

    String message = '''
*SAI RAM HOTEL & SWEETS*
━━━━━━━━━━━━━━━━━━
*MY ORDER*
━━━━━━━━━━━━━━━━━━
''';

    for (final item in cart) {
      message +=
          '• ${item.product.name} × ${item.quantity} = ₹${item.total}\n';
    }

    message += '''
━━━━━━━━━━━━━━━━━━
*GRAND TOTAL: ₹$grandTotal*
━━━━━━━━━━━━━━━━━━

📍 Lakhnadon Rest House ke Samne Petrol Pump
📞 8839796889

Please confirm my order.
''';

    final uri = Uri.parse(
      'https://wa.me/918839796889?text=${Uri.encodeComponent(message)}',
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  // ===================================================
  // CALL
  // ===================================================

  Future<void> callShop() async {
    final uri = Uri.parse(
      'tel:8839796889',
    );

    await launchUrl(uri);
  }

  // ===================================================
  // LOCATION
  // ===================================================

  Future<void> openLocation() async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Lakhnadon+Rest+House+Petrol+Pump',
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  // ===================================================
  // CART
  // ===================================================

  void openCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return CartSheet(
          cart: cart,
          total: grandTotal,
          onPlus: plus,
          onMinus: minus,
          onDelete: deleteItem,
          onPlaceOrder: () {
            Navigator.pop(context);
            showBill();
          },
        );
      },
    );
  }

  // ===================================================
  // BILL
  // ===================================================

  void showBill() {
    if (cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cart empty hai'),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return BillSheet(
          cart: cart,
          total: grandTotal,
          onWhatsApp: () {
            Navigator.pop(context);
            sendWhatsApp();
          },
        );
      },
    );
  }

  // ===================================================
  // UI
  // ===================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF6B351A),
        foregroundColor: Colors.white,

        title: const Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              'Sai Ram',
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
            Text(
              'HOTEL & SWEETS',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),

        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: openCart,
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
                    backgroundColor:
                        Colors.orange,
                    child: Text(
                      '$cartCount',
                      style:
                          const TextStyle(
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

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            // BANNER

            Container(
              width:
                  double.infinity,
              padding:
                  const EdgeInsets.all(22),

              decoration:
                  BoxDecoration(
                color:
                    const Color(
                  0xFFF0D3B5,
                ),
                borderRadius:
                    BorderRadius.circular(
                  22,
                ),
              ),

              child: const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'स्वाद जो याद रह जाए ❤️',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight:
                          FontWeight.bold,
                      color:
                          Color(0xFF54250F),
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Fresh sweets • Pure ingredients • Best taste',
                    style: TextStyle(
                      color:
                          Color(0xFF6B351A),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // CALL LOCATION

            Row(
              children: [
                Expanded(
                  child:
                      ElevatedButton.icon(
                    onPressed:
                        callShop,
                    icon: const Icon(
                      Icons.phone,
                    ),
                    label:
                        const Text(
                      'Call',
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child:
                      ElevatedButton.icon(
                    onPressed:
                        openLocation,
                    icon:
                        const Icon(
                      Icons.location_on,
                    ),
                    label:
                        const Text(
                      'Location',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 21,
                fontWeight:
                    FontWeight.bold,
                color:
                    Color(0xFF54250F),
              ),
            ),

            const SizedBox(height: 12),

            // CATEGORY BUTTONS

            Row(
              children: [
                Expanded(
                  child:
                      CategoryButton(
                    title: 'Sweets',
                    icon:
                        Icons.cake,
                    selected:
                        selectedCategory ==
                            'Sweets',
                    onTap: () {
                      setState(() {
                        selectedCategory =
                            'Sweets';
                      });
                    },
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child:
                      CategoryButton(
                    title: 'Namkeen',
                    icon:
                        Icons.fastfood,
                    selected:
                        selectedCategory ==
                            'Namkeen',
                    onTap: () {
                      setState(() {
                        selectedCategory =
                            'Namkeen';
                      });
                    },
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child:
                      CategoryButton(
                    title: 'Nasta',
                    icon:
                        Icons.restaurant,
                    selected:
                        selectedCategory ==
                            'Nasta',
                    onTap: () {
                      setState(() {
                        selectedCategory =
                            'Nasta';
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                Text(
                  selectedCategory,
                  style:
                      const TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                    color:
                        Color(0xFF54250F),
                  ),
                ),

                Text(
                  '${filteredProdu
