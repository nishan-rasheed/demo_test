import 'package:demo_test/controller/cart_controller.dart';
import 'package:demo_test/model/cart_model.dart';
import 'package:demo_test/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../global_widgets/round_button_widget.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_text_styles.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({
    super.key, required this.image, required this.name, required this.description, required this.price, required this.value,
  });

  final String image;
  final String name;
  final String description;
  final num price;
  final CartController value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
          child:  Column(
            children: [
            ClipRRect(
              borderRadius:const BorderRadius.vertical(top:Radius.circular(15) ),
              child: Image.network(image,
                        height: 20.h,width: double.infinity,
                        fit: BoxFit.fill,),
            ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                    Text(name,
                     maxLines: 1,
                     style: AppTextStyles.normalLargeStyle,
                     ),
                     Text(description,maxLines: 2,overflow: TextOverflow.ellipsis,
                     style: AppTextStyles.normalSmallStyle,),
                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('₹ $price',
                         style: AppTextStyles.normalSmallStyleGreen,),
                        RoundButtonWidget(color: AppColor.primaryColor,)
                       ],
                     ),
                       ],
                     ),
                ),
              ),
            ],
          ),
    )
    // Column(crossAxisAlignment: CrossAxisAlignment.start,
    //      children: [
    //        Image.network(image,
    //        height: 13.h,width: double.infinity,
    //        fit: BoxFit.fill,),
    //        Expanded(child: Padding(
    //          padding:  EdgeInsets.symmetric(horizontal: 3.w),
    //          child: Column(
    //            crossAxisAlignment: CrossAxisAlignment.start,
    //            mainAxisAlignment: MainAxisAlignment.spaceAround,
    //            children: [
    //              Text(name,
    //          maxLines: 2,
    //          style: AppTextStyles.normalLargeStyle,
    //          ),
    //          Text(description,maxLines: 2,overflow: TextOverflow.ellipsis,
    //          style: AppTextStyles.normalSmallStyle,),
    //          Text('₹ $price',
    //          style: AppTextStyles.normalSmallStyle,),
           
    //          Center(
    //            child: ElevatedButton(
    //              onPressed: (){
    //              value.addToCart(
    //               CartModel(
    //                 image: image,
    //                 name: name, 
    //                 price: price, 
    //                 description: description, 
    //                 qty: 1));
    //              }, 
    //              child: Text('add to cart',
    //              style: AppTextStyles.normalLargeStyle,)),
    //          )
    //            ],
    //          ),
    //        ))
    //      ],
    //    )
       ;
  }
}

