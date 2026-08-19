import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B351A),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
      ),
      home: const HomePage(),
    );
  }
}

class Product {
  final String name;
  final int price;
  final String unit;
  final String category;
  final String image;

  const Product({
    required this.name,
    required this.price,
    required this.unit,
    required this.category,
    required this.image,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  int get total => product.price * quantity;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Sweets';

  final List<CartItem> cart = [];

  final List<Product> products = const [

    // ================= SWEETS =================

    Product(
      name: 'Ghewar',
      price: 650,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600',
    ),

    Product(
      name: 'Rasmalai',
      price: 480,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1575377427642-087cf684f29d?w=600',
    ),

    Product(
      name: 'Gulab Jamun',
      price: 280,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1666190094767-3c7e4d8f7a8a?w=600',
    ),

    Product(
      name: 'Malaichap',
      price: 400,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=600',
    ),

    Product(
      name: 'Cham-Cham',
      price: 400,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=600',
    ),

    Product(
      name: 'Rajbhog',
      price: 30,
      unit: 'piece',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1589119908995-c6837fa14848?w=600',
    ),

    Product(
      name: 'Chena',
      price: 240,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=600',
    ),

    Product(
      name: 'Rabdi',
      price: 400,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?w=600',
    ),

    Product(
      name: 'Malai',
      price: 400,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1571115177098-24ec42ed204d?w=600',
    ),

    Product(
      name: 'Dhoodh Barfi',
      price: 400,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=600',
    ),

    Product(
      name: 'Milk Cake',
      price: 480,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1606312619070-d48b4c652a52?w=600',
    ),

    Product(
      name: 'Besan Barfi',
      price: 300,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1587314168485-3236d6710814?w=600',
    ),

    Product(
      name: 'Boondi Laddu',
      price: 240,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1606471191009-63994c53433b?w=600',
    ),

    Product(
      name: 'Balusahi',
      price: 240,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1599785209707-a456fc1337bb?w=600',
    ),

    Product(
      name: 'Magaj Laddu',
      price: 200,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600',
    ),

    Product(
      name: 'Lal Peda',
      price: 360,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1607920592519-0c7e1c8c8c4c?w=600',
    ),

    Product(
      name: 'White Peda',
      price: 380,
      unit: 'kg',
      category: 'Sweets',
      image: 'https://images.unsplash.com/photo-1599599810769-bcde5a160d32?w=600',
    ),

    // ================= NAMKEEN =================

    Product(
      name: 'Namkeen',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      image: 'https://images.unsplash.com/photo-1599599810694-57a3e0e4a3f0?w=600',
    ),

    Product(
      name: 'Dalmoth',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      image: 'https://images.unsplash.com/photo-1627662168804-7e8c2f1b1f1d?w=600',
    ),

    Product(
      name: 'Mixture',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      image: 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600',
    ),

    Product(
      name: 'Farali Namkeen',
      price: 280,
      unit: 'kg',
      category: 'Namkeen',
      image: 'https://images.unsplash.com/photo-1627662168804-7e8c2f1b1f1d?w=600',
    ),

    Product(
      name: 'Sev',
      price: 200,
      unit: 'kg',
      category: 'Namkeen',
      image: 'https://images.unsplash.com/photo-1599599810769-bcde5a160d32?w=600',
    ),

    Product(
      name: 'Chiwda Namkeen',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      image: 'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=600',
    ),

    Product(
      name: 'Logsev',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      image: 'https://images.unsplash.com/photo-1627662168804-7e8c2f1b1f1d?w=600',
    ),

    Product(
      name: 'Katha Metha',
      price: 240,
      unit: 'kg',
      category: 'Namkeen',
      image: 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600',
    ),

    // ================= NASTA =================

    Product(
      name: 'Samosa',
      price: 10,
      unit: 'piece',
      category: 'Nasta',
      image: 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600',
    ),

    Product(
      name: 'Kachori',
      price: 15,
      unit: 'piece',
      category: 'Nasta',
      image: 'https://images.unsplash.com/photo-1628294895950-9805252327bc?w=600',
    ),

    Product(
      name: 'Aloo Bonda',
      price: 10,
      unit: 'piece',
      category: 'Nasta',
      image: 'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=600',
    ),
  ];

  List<Product> get filteredProducts {
    return products
        .where((p) => p.category == selectedCategory)
        .toList();
  }

  int get cartTotal {
    return cart.fold(
      0,
      (sum, item) => sum + item.total,
    );
  }

  int get cartCount {
    return cart.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
  }

  void addToCart(Product product) {
    setState(() {
      final index = cart.indexWhere(
        (item) => item.product.name == product.name,
      );

      if (index == -1) {
        cart.add(CartItem(product: product));
      } else {
        cart[index].quantity++;
      }
    });
  }

  void increase(int index) {
    setState(() {
      cart[index].quantity++;
    });
  }

  void decrease(int index) {
    setState(() {
      cart[index].quantity--;

      if (cart[index].quantity <= 0) {
        cart.removeAt(index);
      }
    });
  }

  Future<void> callShop() async {
    final url = Uri.parse('tel:8839796889');

    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> openLocation() async {
    final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Lakhnadon+Rest+House+Petrol+Pump',
    );

    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> sendWhatsApp() async {
    if (cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pehle cart me item add karo'),
        ),
      );
      return;
    }

    String message = 'SAI RAM HOTEL & SWEETS\n\n';
    message += 'ORDER DETAILS\n';
    message += '-------------------------\n';

    for (final item in cart) {
      message +=
          '${item.product.name} x ${item.quantity} = ₹${item.total}\n';
    }

    message += '-------------------------\n';
    message += 'GRAND TOTAL: ₹$cartTotal\n\n';
    message += '📞 8839796889\n';
    message +=
        '📍 Lakhnadon Rest House ke Samne Petrol Pump';

    final url = Uri.parse(
      'https://wa.me/918839796889?text=${Uri.encodeComponent(message)}',
    );

    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  void openCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (_) {
        return CartSheet(
          cart: cart,
          total: cartTotal,
          onPlus: increase,
          onMinus: decrease,
          onWhatsApp: sendWhatsApp,
        );
      },
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
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: callShop,
            icon: const Icon(Icons.phone),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: openCart,
                icon: const Icon(Icons.shopping_cart),
              ),
              if (cartCount > 0)
                Positioned(
                  right: 5,
                  top: 4,
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

      body: Column(
        children: [
          // SHOP HEADER

          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFF0D3B5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'स्वाद जो याद रह जाए ❤️',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF54250F),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Sai Ram Hotel & Sweets',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Lakhnadon Rest House ke Samne Petrol Pump',
                ),
              ],
            ),
          ),

          // CALL / WHATSAPP / LOCATION

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: callShop,
                    icon: const Icon(Icons.phone),
                    label: const Text('Call'),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: sendWhatsApp,
                    icon: const Icon(Icons.chat),
                    label: const Text('WhatsApp'),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: openLocation,
                    icon: const Icon(Icons.location_on),
                    label: const Text('Location'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // CATEGORIES

          SizedBox(
            height: 55,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              children: [
                categoryButton('Sweets'),
                categoryButton('Namkeen'),
                categoryButton('Nasta'),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // PRODUCT LIST

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(14),
              itemCount: filteredProducts.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return ProductCard(
                  product: product,
                  onAdd: () => addToCart(product),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: cart.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: openCart,
              backgroundColor: const Color(0xFF6B351A),
              foregroundColor: Colors.white,
              icon: const Icon(Icons.shopping_cart),
              label: Text(
                'Cart ₹$cartTotal',
              ),
            )
          : null,
    );
  }

  Widget categoryButton(String title) {
    final selected = selectedCategory == title;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        selected: selected,
        label: Text(title),
        selectedColor: const Color(0xFF6B351A),
        labelStyle: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
        onSelected: (_) {
          setState(() {
            selectedCategory = title;
          });
        },
      ),
    );
  }
}

// =====================================================
// PRODUCT CARD WITH IMAGE
// =====================================================

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE

          SizedBox(
            height: 125,
            width: double.infinity,
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
              loadingBuilder:
                  (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder:
                  (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFF0D3B5),
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 45,
                      color: Color(0xFF6B351A),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
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
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8B451F),
                  ),
                ),

                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onAdd,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF6B351A),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('ADD TO CART'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// CART
// =====================================================

class CartSheet extends StatelessWidget {
  final List<CartItem> cart;
  final int total;
  final void Function(int) onPlus;
  final void Function(int) onMinus;
  final VoidCallback onWhatsApp;

  const CartSheet({
    super.key,
    required this.cart,
    required this.total,
    required this.onPlus,
    required this.onMinus,
    required this.onWhatsApp,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.82,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              '🛒 My Cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF54250F),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return ListTile(
                  title: Text(
                    item.product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '₹${item.product.price}/${item.product.unit}  •  ₹${item.total}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => onMinus(index),
                        icon: const Icon(
                          Icons.remove_circle_outline,
                        ),
                      ),
                      Text(
                        '${item.quantity}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => onPlus(index),
                        icon: const Icon(
                          Icons.add_circle_outline,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'GRAND TOTAL',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '₹$total',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B351A),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onWhatsApp,
                    icon: const Icon(Icons.chat),
                    label: const Text(
                      'PLACE ORDER ON WHATSAPP',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF6B351A),
                      foregroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
