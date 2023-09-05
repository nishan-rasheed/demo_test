import 'package:demo_test/controller/cart_controller.dart';
import 'package:demo_test/global_widgets/title_text_widget.dart';
import 'package:demo_test/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'widget/cart_tile_widget.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
bool isMore = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, value, child) =>
       Scaffold(
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          title: TitleTextWidget(title: 'My Cart',),
        ),
        bottomNavigationBar: Container(height: 10.h,
        margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
        padding: EdgeInsets.symmetric(horizontal:3.w),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sutotal:',
                style: AppTextStyles.normalLargeStyle,),
                Text('₹ ${value.totalCartPrice}',
                style: AppTextStyles.normalLargeStyle,),
              ],
            ),
            ElevatedButton(
              onPressed: (){}, 
              child: Text('buy now'))
          ],
        ),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child:
           ListView.separated(
            itemCount: value.cartList.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 1.h,);
            },
            itemBuilder: (BuildContext context, int index) {
             var item = value.cartList[index];

              return CartTileWidget(
                index: index,
                value: value,
                image:item.image,
                name: item.name,
                price: item.price,
                qty: item.qty,
              );
            },
          ),
        ),
      ),
    );
  }
}

