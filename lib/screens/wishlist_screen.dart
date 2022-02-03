import 'package:flutter/material.dart';
import 'package:project/widgets/empty_wishlist.dart';
import 'package:project/widgets/full_wishlist.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wishList-screen';
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _products = [];
    return !_products.isEmpty
        ? EmptyWishList()
        : Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.delete_rounded),
                ),
              ],
              centerTitle: true,
              title: const Text('Wish List'),
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: 1200,
                child: ListView.builder(
                    itemCount: 10, itemBuilder: (ctx, i) => FullWishList()),
              ),
            ),
            // bottomSheet: _bottomCheckOutSection(),
          );
  }
}
