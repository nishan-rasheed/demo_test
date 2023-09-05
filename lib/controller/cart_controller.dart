import 'dart:developer';

import 'package:demo_test/model/product.dart';
import 'package:flutter/material.dart';

import '../model/cart_model.dart';


  List<Product> allProductList = [
    Product(
      name: 'Allen solly', 
      price: 1200, 
      color: 'white', 
      description: 'Mens Solid Slim Fit Cotton Casual Shirt with Spread Collar & Full Sleeves',
      image: 'https://m.media-amazon.com/images/I/71HBNT3R66L._AC_UL480_FMwebp_QL65_.jpg'),
    Product(
      name: 'Adidas', 
      price: 120, 
      color: 'Black', 
      description:'mens Glarus M Running Shoes',
      image: 'https://m.media-amazon.com/images/I/81xcLHSFSCL._AC_UL480_FMwebp_QL65_.jpg'),
    Product(
      name: 'Peter england', 
      price: 160, 
      color: 'Black', 
      description:'Mens Slim Jeans',
      image: 'https://m.media-amazon.com/images/I/61DUmseTbRL._AC_UL480_FMwebp_QL65_.jpg'),
    Product(
      name: 'Carrylux', 
      price: 134, 
      color: 'Black', 
      description:'Womens Big Purses And Handbags Ladies',
      image: 'https://m.media-amazon.com/images/I/91f5+us9fTL._AC_UL480_FMwebp_QL65_.jpg'),
   Product(
      name: 'Sparx ', 
      price: 189, 
      color: 'Black', 
      description:'Sparx Mens Sd0734g Sneaker',
      image: 'https://m.media-amazon.com/images/I/61++1-R25gL._AC_UL480_FMwebp_QL65_.jpg'),
  ];

class CartController extends ChangeNotifier{

  List<CartModel> cartList = [];

  addToCart(CartModel cart){
    final existingItemIndex =
        cartList.indexWhere((item) => item.name == cart.name);

        if (existingItemIndex != -1) {
          cartList[existingItemIndex].qty += 1;
        }
        else{
          cartList.add(cart);
        }
   getTotalCartPrice();
    
    notifyListeners();
  }



  incrementCartCount(int index){
    cartList[index].qty += 1;
    getTotalCartPrice(); 
    notifyListeners(); 
  }

  decrementCartCount(int index,BuildContext context){
    
    if (cartList[index].qty==1) {
        cartList.removeAt(index);
        Navigator.pop(context);
      }
      else{
        cartList[index].qty -= 1;
      }
      getTotalCartPrice();
    notifyListeners(); 
  }


  deleteCartItem(int index,BuildContext context){
    

   cartList.removeAt(index);
   if (cartList.isEmpty) {
     Navigator.pop(context);
   }
   getTotalCartPrice();
   notifyListeners();
  }


  num totalCartPrice = 0;

  getTotalCartPrice(){

   totalCartPrice = 0;
      for (var item in cartList) {
        totalCartPrice += item.qty*item.price;
      }  

    notifyListeners();   
   
  }

}