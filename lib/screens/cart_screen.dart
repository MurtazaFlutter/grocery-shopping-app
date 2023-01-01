// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_flutter/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                child: Text(
                  'My Cart',
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              value.cartItems.length == 0
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Cart is empty...',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: value.cartItems.length,
                          padding: const EdgeInsets.all(12),
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                    leading: Image.asset(
                                      value.cartItems[index][2],
                                      height: 36,
                                    ),
                                    title: Text('${value.cartItems[index][0]}'),
                                    subtitle:
                                        Text('Rs.' + value.cartItems[index][1]),
                                    trailing: IconButton(
                                        onPressed: () {
                                          Provider.of<CartModel>(context,
                                                  listen: false)
                                              .removeFromCart(index);
                                        },
                                        icon: const Icon(Icons.cancel))),
                              ),
                            );
                          }))),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(color: Colors.green[100]),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Rs. ${value.totalPrice}', //'Rs.${value.calculatePrice()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Text(
                                'Pay Now',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
