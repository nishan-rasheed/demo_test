
import 'package:flutter/material.dart';

import 'home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        clearCart();
      }),
      body: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(cartList[index].name),
          subtitle: Text(cartList[index].qty.toString()),);
        },
      ),
    );
  }
}