import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List fromOne = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
        body: Center(
      child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          color: fromOne[1],
          child: Text(
            fromOne[0],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          )),
    ));
  }
}
