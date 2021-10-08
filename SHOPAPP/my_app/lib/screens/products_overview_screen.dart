import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';
// import 'package:provider/provider.dart';
// import '../providers/products.dart';

enum FavoriteOption { fav, all }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Shop'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FavoriteOption selectedValue) {
                setState(() {
                  if (selectedValue == FavoriteOption.fav) {
                    // productsContainer.showFavoritesOnly();
                    _showOnlyFavorite = true;
                  } else {
                    // productsContainer.showall();
                    _showOnlyFavorite = false;
                  }
                });
              },
              icon: const Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  child: Text('Only favorites'),
                  value: FavoriteOption.fav,
                ),
                const PopupMenuItem(
                  child: Text('Show All'),
                  value: FavoriteOption.all,
                ),
              ],
            ),
          ],
        ),
        body: ProductsGrid(_showOnlyFavorite));
  }
}
