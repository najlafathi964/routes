import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  List<Color> colors = [
    Color(0xffffa1cf), Color(0xffafb4ff), Color(0xffD2DAFF),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => GestureDetector(
                  onTap: () {
                    Navigator.pop(context, colors[index]);
                  },
                  child: Icon(Icons.favorite, size: 80, color: colors[index],)
          )),
        ),
      ),
    );
  }
}
