import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const SaiRamApp());
}

// ================= APP =================

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

// ================= PRODUCT =================

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

// ================= CART ITEM =================

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  int get total => product.price * quantity;
}

// ================= HOME =================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  final List<CartItem> cart = [];

  int get cartCount {
    int count = 0;

    for (final item in cart) {
      count += item.quantity;
    }

    return count;
  }

  int get grandTotal {
    int total = 0;

    for (final item in cart) {
      total += item.total;
    }

    return total;
  }

  // ================= ADD =================

  void addToCart(Product product) {
    setState(() {
      for (final item in cart) {
        if (item.product.name == product.name) {
          item.quantity++;
          return;
        }
      }

      cart.add(
        CartItem(product: product),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${product.name} cart me add ho gaya',
        ),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  // ================= PLUS / MINUS =================

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

  void removeItem(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  // ================= CALL =================

  Future<void> callShop() async {
    final uri = Uri.parse(
      'tel:8839796889',
    );

    await launchUrl(uri);
  }

  // ================= LOCATION =================

  Future<void> openLocation() async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Lakhnadon+Rest+House+Petrol+Pump',
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  // ================= WHATSAPP =================

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

*Mera Order:*

''';

    for (final item in cart) {
      message +=
          '${item.product.name} × ${item.quantity} = ₹${item.total}\n';
    }

    message += '''

--------------------
*TOTAL = ₹$grandTotal*
--------------------

Please confirm my order.

📍 Lakhnadon Rest House ke Samne Petrol Pump
📞 8839796889
''';

    final uri = Uri.parse(
      'https://wa.me/918839796889?text=${Uri.encodeComponent(message)}',
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  // ================= BILL =================

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
      builder: (context) {
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

  // ================= CART =================

  void openCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CartSheet(
          cart: cart,
          total: grandTotal,
          onPlus: increase,
          onMinus: decrease,
          onRemove: removeItem,
          onPlaceOrder: () {
            Navigator.pop(context);
            showBill();
          },
        );
      },
    );
  }

  // ================= UI =================

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
            // ================= BANNER =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: const Color(0xFFF0D3B5),
                borderRadius: BorderRadius.circular(22),
              ),

              child: const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

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

            // ================= CONTACT BUTTONS =================

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: callShop,
                    icon: const Icon(
                      Icons.phone,
                    ),
                    label: const Text(
                      'Call',
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: openLocation,
                    icon: const Icon(
                      Icons.location_on,
                    ),
                    label: const Text(
                      'Location',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const SectionTitle(
              title: 'Shop by Category',
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 105,

              child: ListView(
                scrollDirection:
                    Axis.horizontal,

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
              onAdd: () {
                addToCart(products[0]);
              },
              special: true,
            ),

            const SizedBox(height: 25),

            const SectionTitle(
              title: 'Menu',
            ),

            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(),

              itemCount: products.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.74,
              ),

              itemBuilder: (
                context,
                index,
              ) {
                return ProductCard(
                  product: products[index],

                  onAdd: () {
                    addToCart(
                      products[index],
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 25),

            // ================= SHOP INFO =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF6B351A),
                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: const Column(
                children: [
                  Icon(
                    Icons.storefront,
                    color: Colors.white,
                    size: 40,
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Sai Ram Hotel & Sweets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    '📍 Lakhnadon Rest House ke Samne Petrol Pump',
                    textAlign:
                        TextAlign.center,
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

      // ================= FLOATING CART =================

      floatingActionButton:
          cartCount > 0
              ? FloatingActionButton.extended(
                  onPressed: openCart,

                  backgroundColor:
                      const Color(0xFF6B351A),

                  foregroundColor:
                      Colors.white,

                  icon: const Icon(
                    Icons.shopping_cart,
                  ),

                  label: Text(
                    'Cart • ₹$grandTotal',
                  ),
                )
              : null,

      bottomNavigationBar:
          const BottomNavigationBar(
        currentIndex: 0,

        selectedItemColor:
            Color(0xFF6B351A),

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt_long,
            ),
            label: 'Orders',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ================= SECTION TITLE =================

class SectionTitle
    extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,

          style: const TextStyle(
            fontSize: 21,
            fontWeight:
                FontWeight.bold,
            color:
                Color(0xFF54250F),
          ),
        ),

        const Icon(
          Icons.arrow_forward,
          color:
              Color(0xFF6B351A),
        ),
      ],
    );
  }
}

// ================= CATEGORY =================

class CategoryCard
    extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: 100,

      margin:
          const EdgeInsets.only(
        right: 12,
      ),

      decoration:
          BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(
          18,
        ),

        border: Border.all(
          color:
              const Color(
            0xFFE7D4C2,
          ),
        ),
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [
          Icon(
            icon,

            size: 34,

            color:
                const Color(
              0xFF6B351A,
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          Text(
            title,

            style:
                const TextStyle(
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ================= PRODUCT CARD =================

class ProductCard
    extends StatelessWidget {
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
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding:
          const EdgeInsets.all(
        12,
      ),

      decoration:
          BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(
          18,
        ),

        border: Border.all(
          color:
              const Color(
            0xFFE7D4C2,
          ),
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Expanded(
            child: Container(
              width:
                  double.infinity,

              decoration:
                  BoxDecoration(
                color:
                    const Color(
                  0xFFF3E0CB,
                ),

                borderRadius:
                    BorderRadius.circular(
                  15,
                ),
              ),

              child: Center(
                child: Icon(
                  product.icon,

                  size: special
                      ? 75
                      : 55,

                  color:
                      const Color(
                    0xFF8B451F,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 9,
          ),

          Text(
            product.name,

            maxLines: 1,

            overflow:
                TextOverflow.ellipsis,

            style:
                const TextStyle(
              fontSize: 16,
              fontWeight:
                  FontWeight.bold,
              color:
                  Color(0xFF54250F),
            ),
          ),

          const SizedBox(
            height: 4,
          ),

          Text(
            '₹${product.price}/${product.unit}',

            style:
                const TextStyle(
              fontSize: 14,
              color:
                  Color(0xFF8B451F),
              fontWeight:
                  FontWeight.w600,
            ),
          ),

          const SizedBox(
            height: 7,
          ),

          SizedBox(
            width:
                double.infinity,

            child:
                ElevatedButton(
              onPressed: onAdd,

              style:
                  ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(
                  0xFF6B351A,
                ),

                foregroundColor:
                    Colors.white,

                padding:
                    const EdgeInsets
                        .symmetric(
                  vertical: 9,
                ),

                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius
                          .circular(
                    10,
                  ),
                ),
              ),

              child:
                  const Text(
                'ADD',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= CART SHEET =================

class CartSheet
    extends StatelessWidget {
  final List<CartItem> cart;
  final int total;

  final void Function(
    int index,
  ) onPlus;

  final void Function(
    int index,
  ) onMinus;

  final void Function(
    int index,
  ) onRemove;

  final VoidCallback onPlaceOrder;

  const CartSheet({
    super.key,
    required this.cart,
    required this.total,
    required this.onPlus,
    required this.onMinus,
    required this.onRemove,
    required this.onPlaceOrder,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      height:
          MediaQuery.of(context)
                  .size
                  .height *
              0.78,

      decoration:
          const BoxDecoration(
        color:
            Color(0xFFFFF8F0),

        borderRadius:
            BorderRadius.vertical(
          top: Radius.circular(
            25,
          ),
        ),
      ),

      child: Column(
        children: [
          const Padding(
            padding:
                EdgeInsets.all(
              18,
            ),

            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color:
                      Color(
                    0xFF6B351A,
                  ),
                ),

                SizedBox(
                  width: 10,
                ),

                Text(
                  'Your Cart',

                  style:
                      TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text(
                      'Cart empty hai',
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets
                            .symmetric(
                      horizontal: 16,
                    ),

                    itemCount:
                        cart.length,

                    itemBuilder:
                        (
                      context,
                      index,
                    ) {
                      final item =
                          cart[index];

                      return Card(
                        child:
                            Padding(
                          padding:
                              const EdgeInsets
                                  .all(
                            8,
                          ),

                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color(
                                  0xFFF0D3B5,
                                ),

                                child:
                                    Icon(
                                  item.product
                                      .icon,

                                  color:
                                      const Color(
                                    0xFF6B351A,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                width: 10,
                              ),

                              Expanded(
                                child:
                                    Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,

                                  children: [
                                    Text(
                                      item.product
                                          .name,

                                      style:
                                          const TextStyle(
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                      ),
                                    ),

                                    Text(
                                      '₹${item.product.price}/${item.product.unit}',

                                      style:
                                          const TextStyle(
                                        color:
                                            Colors.black54,
                                      ),
                                    ),

                                    Text(
                                      'Total: ₹${item.total}',

                                      style:
                                          const TextStyle(
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                        color:
                                            Color(
                                          0xFF6B351A,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed:
                                    () {
                                  onMinus(
                                    index,
                                  );
                                },

                                icon:
                                    const Icon(
                                  Icons
                                      .remove_circle_outline,
                                ),
                              ),

                              Text(
                                '${item.quantity}',

                                style:
                                    const TextStyle(
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  fontSize:
                                      16,
                                ),
                              ),

                              IconButton(
                                onPressed:
                                    () {
                                  onPlus(
                                    index,
                                  );
                                },

                                icon:
                                    const Icon(
                                  Icons
                                      .add_circle_outline,
                                ),
                              ),

                              IconButton(
                                onPressed:
                                    () {
                                  onRemove(
                                    index,
                                  );
                                },

                                icon:
                                    const Icon(
                                  Icons.delete_outline,
                                  color:
                                      Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          Container(
            padding:
                const EdgeInsets.fromLTRB(
              18,
              12,
              18,
              20,
            ),

            color:
                Colors.white,

            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: [
                    const Text(
                      'Grand Total',

                      style:
                          TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    Text(
                      '₹$total',

                      style:
                          const TextStyle(
                        fontSize: 23,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            Color(
                          0xFF6B351A,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 12,
                ),

                SizedBox(
                  width:
                      double.infinity,

                  child:
                      ElevatedButton.icon(
                    onPressed:
                        cart.isEmpty
                            ? null
                            : onPlaceOrder,

                    icon:
                        const Icon(
                      Icons.receipt_long,
                    ),

                    label:
                        const Text(
                      'PLACE ORDER',
                    ),

                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          const Color(
                        0xFF6B351A,
                      ),

                      foregroundColor:
                          Colors.white,

                      padding:
                          const EdgeInsets
                              .symmetric(
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

// ================= BILL =================

class BillSheet
    extends StatelessWidget {
  final List<CartItem> cart;
  final int total;
  final VoidCallback onWhatsApp;

  const BillSheet({
    super.key,
    required this.cart,
    required this.total,
    required this.onWhatsApp,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      height:
          MediaQuery.of(context)
                  .size
                  .height *
              0.80,

      decoration:
          const BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.vertical(
          top: Radius.circular(
            25,
          ),
        ),
      ),

      child: Column(
        children: [
          const Padding(
            padding:
                EdgeInsets.all(
              18,
            ),

            child: Column(
              children: [
                Text(
                  'SAI RAM HOTEL & SWEETS',

                  style:
                      TextStyle(
                    fontSize: 21,
                    fontWeight:
                        FontWeight.bold,
                    color:
                        Color(
                      0xFF6B351A,
                    ),
                  ),
                ),

                SizedBox(
                  height: 4,
                ),

                Text(
                  'ORDER BILL',

                  style:
                      TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets
                      .symmetric(
                horizontal: 18,
              ),

              itemCount:
                  cart.length,

              itemBuilder:
                  (
                context,
                index,
              ) {
                final item =
                    cart[index];

                return Padding(
                  padding:
                      const EdgeInsets
                          .symmetric(
                    vertical: 8,
                  ),

                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.product
                              .name,
                        ),
                      ),

                      Text(
                        '${item.quantity} × ₹${item.product.price}',
                      ),

                      const SizedBox(
                        width: 15,
                      ),

                      SizedBox(
                        width: 70,
                        child: Text(
                          '₹${item.total}',
                          textAlign:
                              TextAlign
                                  .right,

                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(),

          Padding(
            padding:
                const EdgeInsets.all(
              18,
            ),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: [
                    const Text(
                      'GRAND TOTAL',

                      style:
                          TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    Text(
                      '₹$total',

                      style:
                          const TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            Color(
                          0xFF6B351A,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 14,
                ),

                SizedBox(
                  width:
                      double.infinity,

                  child:
                      ElevatedButton.icon(
                    onPressed:
                        onWhatsApp,

                    icon:
                        const Icon(
                      Icons.chat,
                    ),

                    label:
                        const Text(
                      'SEND ORDER ON WHATSAPP',
                    ),

                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          const Color(
                        0xFF6B351A,
                      ),

                      foregroundColor:
                          Colors.white,

                      padding:
                          const EdgeInsets
                              .symmetric(
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
