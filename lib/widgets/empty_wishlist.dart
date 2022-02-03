import 'package:flutter/material.dart';

import 'empty_cart.dart';

class EmptyWishList extends StatelessWidget {
  const EmptyWishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/empty-wishlist.png'),
                    fit: BoxFit.fill),
              ),
            ),
            const CartText(
              tSize: 32,
              text: 'Your Wishlist is Empty',
              fw: FontWeight.w600,
            ),
            const CartHeight(sH: 30),
            CartText(
              tSize: 26,
              text: 'Looks like you Didn\'t \nAdd Anything yet',
              color: Theme.of(context).unselectedWidgetColor,
            ),
            const CartHeight(sH: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {},
                child: const CartText(
                  tSize: 20,
                  text: 'Shop Now',
                  color: Colors.white,
                  fw: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
