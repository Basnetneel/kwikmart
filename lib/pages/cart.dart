import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kwik_mart/animation/fade_animation.dart';
import 'package:kwik_mart/pages/payment.dart';
import 'package:kwik_mart/pages/product_view.dart';

import '../models/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  late List<dynamic> cartItems = [];
  List<int> cartItemCount = [1, 1, 1, 1,1,1,1,1];
  int totalPrice = 0;

  Future<void> fetchItems() async {
    final String response = await rootBundle.loadString('assets/products.json');
    
    final data = await json.decode(response);

    cartItems = data['products'].map((data) => Product.fromJson(data)).toList();

    sumTotal();
  }

  sumTotal() {
    cartItems.forEach((item) {
      totalPrice = item.price + totalPrice;
    });
  }

  @override
  void initState() {
    
    super.initState();

    fetchItems().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('My Cart', style: TextStyle(color: Colors.black)),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.53,
            child: cartItems.length > 1
                ? FadeAnimation(
                    1.1,
                    AnimatedList(
                        scrollDirection: Axis.vertical,
                        initialItemCount: cartItems.length,
                        itemBuilder: (context, index, animation) {
                          return Slidable(
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                MaterialButton(
                                  color: Colors.red.withOpacity(0.15),
                                  elevation: 0,
                                  height: 60,
                                  minWidth: 60,
                                  shape: const CircleBorder(),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      totalPrice = totalPrice -
                                          (int.parse(cartItems[index]
                                                  .price
                                                  .toString()) *
                                              cartItemCount[index]);

                                      AnimatedList.of(context).removeItem(index,
                                          (context, animation) {
                                        return cartItem(
                                            cartItems[index], index, animation);
                                      });

                                      cartItems.removeAt(index);
                                      cartItemCount.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                            child: cartItem(cartItems[index], index, animation),
                          );
                        }),
                  )
                : Container(),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            1.1,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text('Shipping', style: TextStyle(fontSize: 20)),
                  Text('\$5.99',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          FadeAnimation(
              1.2,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DottedBorder(
                    color: Colors.grey.shade400,
                    dashPattern: const [10, 10],
                    padding: const EdgeInsets.all(0),
                    child: Container()),
              )),
          FadeAnimation(
              1.2,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Total', style: TextStyle(fontSize: 20)),
                    Text('\$${totalPrice + 5.99}',
                        style:const  TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
              )),
          const SizedBox(height: 10),
          FadeAnimation(
              1.2,
              Padding(
                padding:const  EdgeInsets.all(20.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const PaymentPage()));
                  },
                  height: 50,
                  elevation: 0,
                  splashColor: Colors.yellow[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.yellow[800],
                  child: const Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ))
        ]));
  }

  cartItem(Product product, int index, animation) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductViewPage(product: product)));
      },
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.imageURL,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.brand,
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 14,
                      ),
                    ),
                   const  SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                   const  SizedBox(height: 15),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 10,
                  padding:const  EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      if (cartItemCount[index] > 1) {
                        cartItemCount[index]--;
                        totalPrice = totalPrice - product.price;
                      }
                    });
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.grey.shade400,
                    size: 30,
                  ),
                ),
                Center(
                  child: Text(
                    cartItemCount[index].toString(),
                    style:
                        TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                ),
                MaterialButton(
                  padding:const  EdgeInsets.all(0),
                  minWidth: 10,
                  splashColor: Colors.yellow[700],
                  onPressed: () {
                    setState(() {
                      cartItemCount[index]++;
                      totalPrice = totalPrice + product.price;
                    });
                  },
                  shape: const CircleBorder(),
                  child:const  Icon(
                    Icons.add_circle,
                    size: 30,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
