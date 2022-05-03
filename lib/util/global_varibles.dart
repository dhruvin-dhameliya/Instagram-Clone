import 'package:flutter/material.dart';

import '../screen/add_post_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  Center(
      child: Text("Home Page", style: TextStyle(color: Colors.yellowAccent))),
  Center(child: Text("Search Page", style: TextStyle(color: Colors.green))),
  AddPostScrren(),
  Center(child: Text("Favirot Page", style: TextStyle(color: Colors.pink))),
  Center(child: Text("User Page", style: TextStyle(color: Colors.white))),
];
