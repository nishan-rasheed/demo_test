import 'package:demo_test/controller/cart_controller.dart';
import 'package:demo_test/pages/cartscreen/cart_screen.dart';
import 'package:demo_test/utils/app_assets.dart';
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
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                      }, 
                      icon: Icon(Icons.shopping_bag_outlined,color: Colors.orange,size: 10.w,)),
                  ),
                      
                  Container(
                    height: 15.h,width: 100.w,
                    color: Colors.red,
                  ),
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
                  GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.w,
                      mainAxisSpacing: 1.h,
                      childAspectRatio: 2/3
                    ),
                    itemCount:allProductList.length,
            
                    itemBuilder: (BuildContext context, int index) {
                      var item = allProductList[index];                      
                      return ProductTileWidget(
                        value: value,
                        image: item.image,
                        name: item.name,
                        description: item.description,
                        price: item.price,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



