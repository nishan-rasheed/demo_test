import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'cart_model.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  List products = [
    {
      'name':'white shoes',
      'price':1200,
      'color':'white',
      'description':'anu djhdmhjd'
    },
    {
        'image': 'http://example.com/item1.jpg',
        'name': 'Mens Leather Dress Shoes',
        'price': 120,
        'color': 'Black',
        'description': 'Genuine leather dress shoes for men, perfect for formal occasions.'
    },
    {
        'image': 'http://example.com/item2.jpg',
        'name': 'Womens Running Shoes',
        'price': 75,
        'color': 'Blue',
        'description': 'Comfortable and stylish running shoes for women.'
    },
    {
        'image': 'http://example.com/item3.jpg',
        'name': 'Kids Sneakers',
        'price': 40,
        'color': 'Red',
        'description': 'Fun and colorful sneakers for kids, available in various sizes.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
      }),
      appBar: AppBar(),
    body: Column(
      children: [
        Container(color: Colors.red,
          height: 20.h,width: 20.h,
        ),
      ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
           addToCart(
            CartModel(
              name: products[index]['name'], 
              price: products[index]['price'], 
              description: products[index]['description'], 
              qty: 1));
          },
          child: ListTile(
            title: Text(products[index]['name']),
            subtitle:Text(products[index]['price'].toString()) ,
          ),
        ) ;
      },
    ),
      ],
    )
    );
  }
}

        List<CartModel> cartList = [];

        void addToCart(CartModel cart) {
    final existingItemIndex =
        cartList.indexWhere((item) => item.name == cart.name);

        if (existingItemIndex != -1) {
          cartList[existingItemIndex].qty += 1;
        }
        else{
          cartList.add(cart);
        }
    log(existingItemIndex.toString());
  }

    clearCart(){
    cartList.clear();
    }


