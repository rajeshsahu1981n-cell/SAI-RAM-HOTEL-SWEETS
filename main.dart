import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const SaiRamApp());

const brown = Color(0xFF5A2E12);
const orange = Color(0xFFE86F0A);
const cream = Color(0xFFFFF8EE);

class Product {
  final String name, unit, category, emoji;
  final int price;
  final bool available;
  const Product(this.name, this.price, this.unit, this.category, this.emoji, {this.available=true});
}

const items = <Product>[
  Product('Ghewar',650,'kg','Sweets','🍯'),
  Product('Rasmalai',480,'kg','Sweets','🍮'),
  Product('Gulab Jamun',280,'kg','Sweets','🟤'),
  Product('Malaichap',400,'kg','Sweets','🍮'),
  Product('Cham-Cham',400,'kg','Sweets','🍬'),
  Product('Rajbhog',30,'piece','Sweets','🟡'),
  Product('Chena',240,'kg','Sweets','🍥'),
  Product('Rabdi',400,'kg','Sweets','🥛'),
  Product('Malaria',400,'kg','Sweets','🍬'),
  Product('Dhoodh Barfi',400,'kg','Sweets','⬜'),
  Product('Milk Cake',480,'kg','Sweets','🍰'),
  Product('Besan Barfi',300,'kg','Sweets','🟨'),
  Product('Boondi Laddu',240,'kg','Sweets','🟠'),
  Product('Nariyal Laddu',0,'not available','Sweets','🥥',available:false),
  Product('Nariyal Barfi',0,'not available','Sweets','🥥',available:false),
  Product('Balusahi',240,'kg','Sweets','🍩'),
  Product('Magaj Laddu',200,'kg','Sweets','🟠'),
  Product('Lal Peda',360,'kg','Sweets','🔴'),
  Product('White Peda',380,'kg','Sweets','⚪'),
  Product('Namkeen',240,'kg','Nasta','🥨'),
  Product('Samosa',10,'piece','Nasta','🥟'),
  Product('Kachori',15,'piece','Nasta','🥟'),
  Product('Aloobanda',10,'piece','Nasta','🟤'),
];

class SaiRamApp extends StatelessWidget {
  const SaiRamApp({super.key});
  @override Widget build(BuildContext context)=>MaterialApp(
    debugShowCheckedModeBanner:false,
    title:'Sai Ram Hotel & Sweets',
    theme:ThemeData(useMaterial3:true,scaffoldBackgroundColor:cream,colorScheme:ColorScheme.fromSeed(seedColor:brown)),
    home:const MainPage(),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override State<MainPage> createState()=>_MainPageState();
}
class _MainPageState extends State<MainPage>{
  int tab=0;
  final Map<Product,int> cart={};

  void add(Product p){if(!p.available)return;setState(()=>cart[p]=(cart[p]??0)+1);}
  void sub(Product p){setState((){if((cart[p]??0)<=1)cart.remove(p);else cart[p]=cart[p]!-1;});}
  int get cartCount=>cart.values.fold(0,(a,b)=>a+b);
  int get total=>cart.entries.fold(0,(s,e)=>s+e.key.price*e.value);

  Future<void> call()async=>launchUrl(Uri.parse('tel:8839796889'));
  Future<void> map()async=>launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=Lakhnadon+Rest+House+petrol+pump'),mode:LaunchMode.externalApplication);
  Future<void> whatsapp()async{
    if(cart.isEmpty)return;
    final order=cart.entries.map((e)=>'${e.key.name} x ${e.value}').join('%0A');
    final msg='Namaste Sai Ram Hotel & Sweets!%0A$order%0AApprox Total: ₹$total%0AAddress: Lakhnadon Rest House ke samne petrol pump';
    await launchUrl(Uri.parse('https://wa.me/918839796889?text=$msg'),mode:LaunchMode.externalApplication);
  }

  @override Widget build(BuildContext context){
    final pages=[
      HomePage(add:add,goMenu:()=>setState(()=>tab=1),map:map,call:call),
      MenuPage(add:add),
      CartPage(cart:cart,add:add,sub:sub,total:total,order:whatsapp),
      const OrdersPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body:pages[tab],
      bottomNavigationBar:NavigationBar(
        selectedIndex:tab,onDestinationSelected:(i)=>setState(()=>tab=i),
        destinations:[
          const NavigationDestination(icon:Icon(Icons.home_outlined),selectedIcon:Icon(Icons.home),label:'Home'),
          const NavigationDestination(icon:Icon(Icons.grid_view_outlined),selectedIcon:Icon(Icons.grid_view),label:'Categories'),
          NavigationDestination(icon:Badge(isLabelVisible:cartCount>0,label:Text('$cartCount'),child:const Icon(Icons.shopping_cart_outlined)),label:'Cart'),
          const NavigationDestination(icon:Icon(Icons.receipt_long_outlined),label:'Orders'),
          const NavigationDestination(icon:Icon(Icons.person_outline),label:'Profile'),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget{
  const Header({super.key});
  @override Widget build(BuildContext context)=>Padding(
    padding:const EdgeInsets.fromLTRB(18,18,18,8),
    child:Row(children:[
      IconButton(onPressed:()=>Scaffold.of(context).openDrawer(),icon:const Icon(Icons.menu,color:brown)),
      const Expanded(child:Column(children:[
        Text('ॐ  Sai Ram',style:TextStyle(fontSize:30,fontWeight:FontWeight.w900,color:brown)),
        Text('HOTEL & SWEETS',style:TextStyle(fontSize:13,letterSpacing:2,fontWeight:FontWeight.bold,color:brown)),
        Text('Shuddh Swaad, Sai Ram ke Saath',style:TextStyle(fontSize:12,color:orange)),
      ])),
      const Icon(Icons.notifications_none,color:brown),
    ]),
  );
}

class HomePage extends StatelessWidget{
  final void Function(Product) add; final VoidCallback goMenu,map,call;
  const HomePage({super.key,required this.add,required this.goMenu,required this.map,required this.call});
  @override Widget build(BuildContext context)=>SafeArea(child:Builder(builder:(ctx)=>Scaffold(
    backgroundColor:cream,
    body:ListView(padding:const EdgeInsets.fromLTRB(18,4,18,18),children:[
      const _BrandHeader(),
      const SizedBox(height:12),
      Container(height:270,padding:const EdgeInsets.all(22),decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(24),
        gradient:const LinearGradient(colors:[Color(0xFFFFE8C2),Color(0xFFFFC66D)]),
      ),child:Column(crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.center,children:[
        const Text('Pure Taste',style:TextStyle(fontSize:20,fontStyle:FontStyle.italic,color:Color(0xFF8B4513))),
        const Text('PURE SWEETS',style:TextStyle(fontSize:28,fontWeight:FontWeight.w900,color:brown)),
        const Text('PURE HAPPINESS',style:TextStyle(fontSize:27,fontWeight:FontWeight.w900,color:orange)),
        const SizedBox(height:10),
        const Text('Premium Quality • Pure Ingredients'),
        const SizedBox(height:20),
        FilledButton(onPressed:goMenu,style:FilledButton.styleFrom(backgroundColor:brown),child:const Text('ORDER NOW')),
      ])),
      const SizedBox(height:18),
      Row(children:[
        Expanded(child:_Feature(icon:Icons.delivery_dining,title:'Fast Delivery',sub:'At Your Doorstep')),
        Expanded(child:_Feature(icon:Icons.verified,title:'Pure & Fresh',sub:'Best Quality')),
        Expanded(child:_Feature(icon:Icons.local_offer,title:'Best Offers',sub:'Everyday')),
        Expanded(child:_Feature(icon:Icons.shield,title:'Hygienic',sub:'& Safe')),
      ]),
      const SizedBox(height:24),
      Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
        const Text('Shop by Category',style:TextStyle(fontSize:21,fontWeight:FontWeight.bold,color:brown)),
        TextButton(onPressed:goMenu,child:const Text('View All')),
      ]),
      Row(children:[
        _Category(title:'Sweets',emoji:'🍬',onTap:goMenu),
        _Category(title:'Hotel / Food',emoji:'🍽️',onTap:goMenu),
        _Category(title:'Namkeen',emoji:'🥨',onTap:goMenu),
        _Category(title:'Gift Hampers',emoji:'🎁',onTap:goMenu),
      ]),
      const SizedBox(height:24),
      const Text("Today's Special",style:TextStyle(fontSize:21,fontWeight:FontWeight.bold,color:brown)),
      const SizedBox(height:10),
      _Special(product:items.first,add:add),
      const SizedBox(height:18),
      Row(children:[
        Expanded(child:OutlinedButton.icon(onPressed:call,icon:const Icon(Icons.call),label:const Text('Call Shop'))),
        const SizedBox(width:10),
        Expanded(child:OutlinedButton.icon(onPressed:map,icon:const Icon(Icons.location_on),label:const Text('Location'))),
      ]),
    ]),
  )));
}

class _BrandHeader extends StatelessWidget{
  const _BrandHeader();
  @override Widget build(BuildContext context)=>const Column(children:[
    Text('☀️',style:TextStyle(fontSize:28)),
    Text('Sai Ram',style:TextStyle(fontSize:42,fontStyle:FontStyle.italic,fontWeight:FontWeight.w900,color:brown)),
    Text('HOTEL & SWEETS',style:TextStyle(fontSize:16,letterSpacing:2,fontWeight:FontWeight.bold,color:brown)),
    Text('— Shuddh Swaad, Sai Ram ke Saath —',style:TextStyle(color:orange)),
  ]);
}

class _Feature extends StatelessWidget{
  final IconData icon; final String title,sub;
  const _Feature({required this.icon,required this.title,required this.sub});
  @override Widget build(BuildContext context)=>Column(children:[
    CircleAvatar(backgroundColor:const Color(0xFFFFE5C2),child:Icon(icon,color:brown,size:22)),
    const SizedBox(height:6),Text(title,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:11)),Text(sub,style:const TextStyle(fontSize:9,color:Colors.grey)),
  ]);
}

class _Category extends StatelessWidget{
  final String title,emoji; final VoidCallback onTap;
  const _Category({required this.title,required this.emoji,required this.onTap});
  @override Widget build(BuildContext context)=>Expanded(child:GestureDetector(onTap:onTap,child:Container(
    margin:const EdgeInsets.only(right:7),padding:const EdgeInsets.symmetric(vertical:13),
    decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(15),border:Border.all(color:const Color(0xFFFFD7A0))),
    child:Column(children:[Text(emoji,style:const TextStyle(fontSize:34)),const SizedBox(height:5),Text(title,textAlign:TextAlign.center,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:10,color:brown))]),
  )));
}

class _Special extends StatelessWidget{
  final Product product; final void Function(Product) add;
  const _Special({required this.product,required this.add});
  @override Widget build(BuildContext context)=>Container(
    padding:const EdgeInsets.all(12),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(20)),
    child:Row(children:[
      Container(width:130,height:130,decoration:BoxDecoration(color:const Color(0xFFFFE0B2),borderRadius:BorderRadius.circular(15)),child:const Center(child:Text('🍯',style:TextStyle(fontSize:70)))),
      const SizedBox(width:14),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        const Text('10% OFF',style:TextStyle(color:Colors.red,fontWeight:FontWeight.bold)),
        Text(product.name,style:const TextStyle(fontSize:19,fontWeight:FontWeight.bold,color:brown)),
        const Text('Pure Desi Ghee • Premium Quality',style:TextStyle(fontSize:11,color:Colors.grey)),
        const SizedBox(height:7),
        Text('₹${product.price} / Kg',style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:orange)),
        const SizedBox(height:7),
        FilledButton(onPressed:()=>add(product),style:FilledButton.styleFrom(backgroundColor:orange),child:const Text('ORDER NOW')),
      ])),
    ]),
  );
}

class MenuPage extends StatelessWidget{
  final void Function(Product) add;
  const MenuPage({super.key,required this.add});
  @override Widget build(BuildContext context)=>SafeArea(child:Scaffold(
    backgroundColor:cream,
    appBar:AppBar(title:const Text('Our Menu',style:TextStyle(fontWeight:FontWeight.bold,color:brown)),backgroundColor:cream),
    body:ListView(padding:const EdgeInsets.all(16),children:[
      const Text('Sweets',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold,color:brown)),
      const SizedBox(height:8),
      ...items.where((p)=>p.category=='Sweets').map((p)=>_Item(p:p,add:add)),
      const SizedBox(height:14),
      const Text('Nasta & Namkeen',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold,color:brown)),
      ...items.where((p)=>p.category=='Nasta').map((p)=>_Item(p:p,add:add)),
    ]),
  ));
}

class _Item extends StatelessWidget{
  final Product p; final void Function(Product) add;
  const _Item({required this.p,required this.add});
  @override Widget build(BuildContext context)=>Card(
    margin:const EdgeInsets.only(bottom:9),child:ListTile(
      leading:CircleAvatar(backgroundColor:const Color(0xFFFFE5C2),child:Text(p.emoji,style:const TextStyle(fontSize:20))),
      title:Text(p.name,style:const TextStyle(fontWeight:FontWeight.bold)),
      subtitle:Text(p.available?'₹${p.price} / ${p.unit}':'Not available'),
      trailing:p.available?FilledButton(onPressed:()=>add(p),child:const Text('ADD')):const Text('N/A'),
    ),
  );
}

class CartPage extends StatelessWidget{
  final Map<Product,int> cart; final void Function(Product) add,sub; final int total; final VoidCallback order;
  const CartPage({super.key,required this.cart,required this.add,required this.sub,required this.total,required this.order});
  @override Widget build(BuildContext context)=>SafeArea(child:Scaffold(
    backgroundColor:cream,appBar:AppBar(title:const Text('Your Cart',style:TextStyle(fontWeight:FontWeight.bold,color:brown)),backgroundColor:cream),
    body:cart.isEmpty?const Center(child:Text('Cart abhi empty hai 🛒',style:TextStyle(fontSize:18))):Column(children:[
      Expanded(child:ListView(padding:const EdgeInsets.all(16),children:cart.entries.map((e)=>Card(child:ListTile(
        title:Text(e.key.name,style:const TextStyle(fontWeight:FontWeight.bold)),
        subtitle:Text('₹${e.key.price} / ${e.key.unit}'),
        trailing:Row(mainAxisSize:MainAxisSize.min,children:[
          IconButton(onPressed:()=>sub(e.key),icon:const Icon(Icons.remove_circle_outline)),Text('${e.value}'),IconButton(onPressed:()=>add(e.key),icon:const Icon(Icons.add_circle_outline)),
        ]),
      ))).toList())),
      Padding(padding:const EdgeInsets.all(16),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
        Text('₹$total',style:const TextStyle(fontSize:22,fontWeight:FontWeight.bold,color:brown)),
        FilledButton.icon(onPressed:order,icon:const Icon(Icons.chat),label:const Text('WhatsApp Order')),
      ])),
    ]),
  ));
}

class OrdersPage extends StatelessWidget{const OrdersPage({super.key});@override Widget build(BuildContext context)=>const Scaffold(backgroundColor:cream,body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Icon(Icons.receipt_long,size:70,color:brown),SizedBox(height:12),Text('Your Orders',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold,color:brown)),Text('WhatsApp orders yahan se manage honge.')])));}

class ProfilePage extends StatelessWidget{const ProfilePage({super.key});@override Widget build(BuildContext context)=>Scaffold(backgroundColor:cream,appBar:AppBar(title:const Text('Profile',style:TextStyle(color:brown)),backgroundColor:cream),body:ListView(padding:const EdgeInsets.all(20),children:[
  const CircleAvatar(radius:45,backgroundColor:Color(0xFFFFE5C2),child:Icon(Icons.store,size:50,color:brown)),
  const SizedBox(height:16),const Center(child:Text('Sai Ram Hotel & Sweets',style:TextStyle(fontSize:22,fontWeight:FontWeight.bold,color:brown))),
  const SizedBox(height:20),
  const ListTile(leading:Icon(Icons.phone,color:orange),title:Text('8839796889'),subtitle:Text('Call / WhatsApp')),
  const ListTile(leading:Icon(Icons.location_on,color:orange),title:Text('Lakhnadon Rest House ke samne petrol pump'),subtitle:Text('Shop Address')),
]));}
