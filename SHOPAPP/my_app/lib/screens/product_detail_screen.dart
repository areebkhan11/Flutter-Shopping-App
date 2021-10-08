import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen(this.title);
  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final ProductID =
        ModalRoute.of(context)!.settings.arguments as String; // is the id
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findByID(ProductID);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
