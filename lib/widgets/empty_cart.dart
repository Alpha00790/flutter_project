import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  image: AssetImage('assets/images/emptycart.png'),
                  fit: BoxFit.fill),
            ),
          ),
          const CartText(
            tSize: 32,
            text: 'Your Cart is Empty',
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
    );
  }
}

class CartHeight extends StatelessWidget {
  final double sH;
  const CartHeight({
    required this.sH,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sH,
    );
  }
}

class CartText extends StatelessWidget {
  final FontWeight? fw;
  final String text;
  final double tSize;
  final Color? color;
  const CartText({
    Key? key,
    this.color,
    this.fw,
    required this.tSize,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: tSize, color: color, fontWeight: fw),
    );
  }
}
