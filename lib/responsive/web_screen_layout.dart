import 'package:flutter/material.dart';
import 'package:instaclon_flutterfire/screen/home_screen.dart';

class webScreenLayout extends StatelessWidget {
  const webScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: Center(
      //   child: Text("It is web layout", style: TextStyle(
      //     fontSize: 25,
      //     color: Colors.yellowAccent,
      //     fontWeight: FontWeight.bold,
      //   ),),
      // ),

      body: HomeScreen(),
    );
  }
}
