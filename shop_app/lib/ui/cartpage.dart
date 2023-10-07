import 'package:flutter_slidable/flutter_slidable.dart';
import '../shared/app_style.dart';
import '../shared/export.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCart();

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: const Icon(AntIcons.close,color: Colors.black),
              ),
              Text("My Cart",style: appStyle(36, Colors.black, FontWeight.bold),),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.65,
                child: ListView.builder(
                  itemCount: cartProvider.cart.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, index) {
                    final data =cartProvider.cart[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius:  const BorderRadius.all(Radius.circular(12)),
                        child: Slidable(
                          key: const ValueKey(0),
                          endActionPane:  ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                flex: 1,
                                onPressed: (_){
                                  cartProvider.deleteCart(data["key"]);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
                                },//doNothing,
                                backgroundColor: const Color(0xFF000000),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: "Delete",
                              ),
                            ]),
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.15,//0.11
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              boxShadow: [BoxShadow(
                                color: Colors.grey.shade500,
                                spreadRadius: 5,
                                blurRadius: 0.3,
                                offset: const Offset(0, 1)
                              )],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: CachedNetworkImage(
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.fill,
                                        imageUrl: data["imageUrl"]
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -2,
                                      child: GestureDetector(
                                        onTap: (){
                                          cartProvider.deleteCart(data["key"]);
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),));
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(12))
                                          ),
                                          child: const Icon(
                                            AntIcons.delete,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12,left: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(data["name"],style: appStyle(16, Colors.black, FontWeight.bold),),
                                        const SizedBox(height: 5),
                                        Text(data["category"],style: appStyle(14, Colors.grey, FontWeight.w600),),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(data["price"],style: appStyle(18, Colors.black, FontWeight.w600),),
                                            const SizedBox(width: 40),
                                            Text("Size ",style: appStyle(18, Colors.black, FontWeight.w600),),
                                            const SizedBox(width: 15),
                                            Text("${data["sizes"]}",style: appStyle(18, Colors.black, FontWeight.w600),),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(16)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              cartProvider.increment();
                                            },
                                            child: const Icon(AntIcons.minus_square,size: 20,color: Colors.grey),
                                          ),
                                          Text(data["qty"].toString(),style: appStyle(16, Colors.black, FontWeight.bold)),
                                          InkWell(
                                            onTap: (){
                                              // cartProvider.decrement;
                                            },
                                            child: const Icon(AntIcons.plus_square,size: 20,color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CheckoutButton(label: "Proceed to Checkout"),
          ),
        ],
        ),
      ),
    );
  }
}