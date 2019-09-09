import 'package:flutter/material.dart';

class AppBarComponent extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AppBarComponentState createState() => _AppBarComponentState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(92);
}

class _AppBarComponentState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextField(
          textAlign: TextAlign.center,
          maxLines: 1,
          decoration: InputDecoration(
            labelText: 'A quem deseja pagar?',
            labelStyle: TextStyle(
              color: Colors.grey[50],
            ),
            prefixIcon: Icon(Icons.search),
            focusColor: Colors.greenAccent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ),
    );
  }
}
