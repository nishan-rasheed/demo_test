import 'package:demo_test/controller/cart_controller.dart';
import 'package:demo_test/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'pages/homescreen/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => 
         MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CartController()),
          ],
         child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.poppins()
            ),
            scaffoldBackgroundColor: AppColor.backgroundColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:  HomeScreen(),
             ),
       ),
    );
  }
}
