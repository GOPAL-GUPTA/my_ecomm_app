import 'package:flutter/material.dart';
import 'package:grk_001/widgets/products_grid.dart';

class FavouriteScreen extends StatelessWidget {
  static const String routename = 'Favouritescreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
        centerTitle: true,
      ),
      body: Products_grid(true),
    );
  }
}
