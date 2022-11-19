import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routes/medules/hotel/hotel_home_page.dart';

import 'medules/routes/first_screen.dart';
import 'medules/routes/second_screen.dart';
import 'medules/routes/third_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375,812),
        minTextAdapt: false,
        builder: (context,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
           // home:  HotelHomePage(),
             initialRoute: '/firstScreen',
             routes: {
               '/firstScreen' : (context)=>FirstScreen() ,
               '/secondScreen' : (context) => SecondScreen(),
               '/thirdScreen' : (context) => ThirdScreen(),
             },
          );
        }
    );
  }
}