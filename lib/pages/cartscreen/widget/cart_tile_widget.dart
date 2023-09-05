import 'package:demo_test/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_text_styles.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget({
    super.key, required this.image, required this.name, 
    required this.price, required this.qty, required this.value, required this.index,
  });

  final String image;
  final String name;
  final num price;
  final num qty;
  final CartController value;
  final int index; 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        
      ),
       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 10.w,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(width: 3.w,),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(name,
                     maxLines: 2,
                    style: AppTextStyles.titleHedingStyle,),
                ),
                IconButton(onPressed: (){
                  value.deleteCartItem(index,context);
                },
                  icon: Icon(Icons.delete,size: 10.w,
                  )),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('₹ $price',
                style: AppTextStyles.normalLargeStyle,),
                Row(
                    children: [
                 IconButton(onPressed: (){
                  value.incrementCartCount(index);
                 }, 
                 icon:  Icon(Icons.add,size: 10.w,)),
                  Text(qty.toString(),
                  style: AppTextStyles.normalLargeStyle,),
                  IconButton(onPressed: (){
                    value.decrementCartCount(index,context);
                  }, 
                 icon:  Icon(Icons.remove,size: 10.w,)),
                                    ],
                                  ),
              ],
            )
              ],
            ),
          )
          
          
          
          
        ],
       ),
    );
  }
}