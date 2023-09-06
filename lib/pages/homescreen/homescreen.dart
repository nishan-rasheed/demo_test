import 'package:demo_test/controller/cart_controller.dart';
import 'package:demo_test/global_widgets/round_button_widget.dart';
import 'package:demo_test/pages/cartscreen/cart_screen.dart';
import 'package:demo_test/utils/app_assets.dart';
import 'package:demo_test/utils/app_color.dart';
import 'package:demo_test/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../global_widgets/title_text_widget.dart';
import 'widgets/product_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.w),
            child: Consumer<CartController>(
              builder: (context, value, child) =>
               Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(),
                      Text('Welcome Back',style:AppTextStyles.normalLargeStyle,),
                      Spacer(),
                      RoundButtonWidget(color:  AppColor.greyShade,iconColor: AppColor.textColorPrimary,),
                    ],
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search products here'
                            ),
                          )), 

                      ],
                    ),
                  ),
                  Image.asset(AppAssets.banner,
                  fit: BoxFit.cover,
                  height: 15.h,width: 100.w,
                  ),
                      
                  // Container(
                  //   height: 15.h,width: 100.w,
                  //   color: Colors.red,
                  // ),
                  const TitleTextWidget(title: 'Categories',),
                  Container(
                    height: 15.h,
                    color: Colors.green,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 5.w,);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CircleAvatar(
                          radius: 7.h,
                          child: FittedBox(child: Text('sjhsbhsbh'))
                        );
                      },
                    ),
                  ),
                  const TitleTextWidget(title: 'Products',),

                  SizedBox(
                    height: 38.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: allProductList.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 5.w,);
                      },
                      itemBuilder: (BuildContext context, int index) {
                      var item = allProductList[index];                      
                      return
                       ProductTileWidget(
                        value: value,
                        image: item.image,
                        name: item.name,
                        description: item.description,
                        price: item.price,
                      );
                      },
                    ),
                  ),
                  // GridView.builder(
                  //   physics: ScrollPhysics(),
                  //   shrinkWrap: true,
                  //   gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     crossAxisSpacing: 1.w,
                  //     mainAxisSpacing: 1.h,
                  //     childAspectRatio: 2/3
                  //   ),
                  //   itemCount:allProductList.length,
            
                  //   itemBuilder: (BuildContext context, int index) {
                  //     var item = allProductList[index];                      
                  //     return ProductTileWidget(
                  //       value: value,
                  //       image: item.image,
                  //       name: item.name,
                  //       description: item.description,
                  //       price: item.price,
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



