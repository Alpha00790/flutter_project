import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:project/models_and_providers/product.dart';
import 'package:project/screens/inner_screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class FeedsProduct extends StatefulWidget {
  @override
  _FeedsProductState createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  @override
  Widget build(BuildContext context) {
    final productAttribute = Provider.of<Product>(context);
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: productAttribute.id),
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      productAttribute.imageUrl,
                      fit: BoxFit.cover,
                      // width: double.infinity,
                    ),
                  ),
                  constraints: BoxConstraints(
                    // maxWidth: MediaQuery.of(context).size.width,
                    minHeight: 130,
                    maxHeight: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  productAttribute.description,
                  maxLines: 1,
                  style: (TextStyle(
                    fontSize: 18,
                    overflow: TextOverflow.visible,
                  )),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '\$ ${productAttribute.price}',
                  maxLines: 1,
                  style: (TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity: ${productAttribute.quantity} left',
                        maxLines: 1,
                        style: (TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.visible,
                          color: Colors.blueGrey,
                        )),
                      ),
                      InkWell(
                        onTap: () => {},
                        child: const Icon(Icons.more_horiz_rounded),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Badge(
            toAnimate: true,
            animationType: BadgeAnimationType.fade,
            animationDuration: Duration(milliseconds: 2000),
            shape: BadgeShape.square,
            badgeColor: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8),
            badgeContent: Text('NEW', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
