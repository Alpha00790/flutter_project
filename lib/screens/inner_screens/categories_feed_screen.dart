import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project/models_and_providers/product.dart';
import 'package:project/widgets/feeds_product.dart';
import 'package:provider/provider.dart';

class CategoriesFeedsScreen extends StatelessWidget {
  static const routeName = '/Categories-feeds-screen';
  const CategoriesFeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catName = ModalRoute.of(context)!.settings.arguments as String;
    final productProvider = Provider.of<ProductProvider>(context);
    List<Product> productsList = productProvider.getByCatName(catName);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(catName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: productsList.length,
          itemBuilder: (BuildContext context, int i) =>
              ChangeNotifierProvider.value(
            value: productsList[i],
            child: FeedsProduct(),
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 3 : 4),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
      ),
    );
  }
}
