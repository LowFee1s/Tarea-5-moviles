import 'package:flutter/material.dart';

class CupcakeAppBar extends AppBar {
  CupcakeAppBar({
    Key? key,
    required String title,
  }) : super(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black, //encabezados
            ),
          ), 
          key: key,
        );
}
