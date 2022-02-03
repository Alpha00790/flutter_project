import 'package:flutter/material.dart';
import 'package:project/models_and_providers/product.dart';
import 'package:project/screens/inner_screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class BrandNavRailWidget extends StatelessWidget {
  const BrandNavRailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productAttribute = Provider.of<Product>(context, listen: false);
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: productAttribute.id),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.only(left: 8, right: 8),
          height: 300,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        productAttribute.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   child: IconButton(
                  //     icon: Icon(Icons.favorite_rounded),
                  //     onPressed: () => {},
                  //   ),
                  //   top: 12,
                  //   right: 12,
                  // ),
                  Positioned(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text('\$${productAttribute.price}'),
                      ),
                    ),
                    bottom: 12,
                    right: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  '${productAttribute.title}',
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${productAttribute.description}",
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    // InkWell(
                    //   onTap: () => {},
                    //   child: Icon(Icons.add_shopping_cart_rounded),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
