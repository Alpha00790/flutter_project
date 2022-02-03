import 'package:flutter/material.dart';

import 'full_cart.dart';

class FullWishList extends StatefulWidget {
  const FullWishList({Key? key}) : super(key: key);

  @override
  State<FullWishList> createState() => _FullWishListState();
}

class _FullWishListState extends State<FullWishList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: double.infinity,
          height: 165,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 130,
                // color: Colors.blueGrey,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/162466/clock-watch-time-hand-162466.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Monitor 2',
                            overflow: TextOverflow.visible,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () => {},
                            child: Icon(
                              Icons.close_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Costing(text: 'Price : ', cost: '\$ 450'),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Text(
                        'Description',
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontSize: 20),
                      ),
                    )
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
