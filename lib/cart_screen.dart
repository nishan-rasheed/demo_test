
import 'package:flutter/material.dart';

import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}



class _CartScreenState extends State<CartScreen> {


   num totalCartPrice = 0.0;

   // Calculate the total price
  void calculateTotal() {
    totalCartPrice = 0.0;
    for (var item in cartList) {
      totalCartPrice += item.price * item.qty;
    }
  }


  @override
  Widget build(BuildContext context) {
   calculateTotal();
     
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        clearCart();
      }),
      bottomNavigationBar:Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(totalCartPrice.toString()),
            ElevatedButton(
              onPressed: (){}, 
              child: Text('data'))
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(cartList[index].name),
          subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartList[index].qty.toString()),
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      cartList[index].qty +=1;
                      setState(() {});
                    }, 
                    icon: Icon(Icons.add)),
                  Text('data'),
                  IconButton(
                    onPressed: (){
                      if (cartList[index].qty==1) {
                        cartList.removeAt(index);
                      }
                      else{
                        cartList[index].qty -= 1;
                      }
                      setState(() {});
                    }, 
                    icon: Icon(Icons.remove)),  
                ],
              )
            ],
          ),
          trailing: IconButton(
            onPressed: (){
              cartList.removeAt(index);
              setState(() {});
            }, 
            icon: Icon(Icons.delete)),
          );
        },
      ),
    );
  }
}