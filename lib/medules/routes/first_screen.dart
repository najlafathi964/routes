import 'package:routes/medules/routes/second_screen.dart';
import 'package:routes/medules/routes/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Color? background;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () async {
                Color value = await Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen())) ??
                    Colors.white;

                setState(() {
                  background = value;
                });
              },
              child: Container(
                  height: 55.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Center(
                      child: Text(
                    'Go To Second Screen  -> ',
                    style: TextStyle(
                        color: background ?? Colors.white, fontSize: 20),
                  ))),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThirdScreen(),
                        settings: RouteSettings(arguments: [
                          'Hello, this text was sent from the first screen ',
                          background
                        ])));
              },
              child: Container(
                  height: 55.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Center(
                      child: Text(
                    'Send To Third Screen -> ',
                    style: TextStyle(
                        color: background ?? Colors.white, fontSize: 20),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
