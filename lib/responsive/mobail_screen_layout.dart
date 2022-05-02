import 'package:flutter/material.dart';
import 'package:instaclon_flutterfire/model/user.dart' as model;
import 'package:instaclon_flutterfire/providers/use_providerr.dart';
import 'package:provider/provider.dart';

class mobailScreenLayout extends StatefulWidget {
  const mobailScreenLayout({Key? key}) : super(key: key);

  @override
  State<mobailScreenLayout> createState() => _mobailScreenLayoutState();
}

class _mobailScreenLayoutState extends State<mobailScreenLayout> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: Text(
          "Usename: ${user.username} \n\n Email: ${user.email} \n\n Password: ${user.password}",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
