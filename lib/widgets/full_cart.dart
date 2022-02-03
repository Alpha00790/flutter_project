import 'package:flutter/material.dart';
import 'package:project/widgets/empty_cart.dart';

class FullCart extends StatefulWidget {
  const FullCart({Key? key}) : super(key: key);

  @override
  _FullCartState createState() => _FullCartState();
}

class _FullCartState extends State<FullCart> {
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
                    Costing(text: 'Sub Total : ', cost: '\$ 450'),
                    Costing(text: 'Shipping : ', cost: '\$ 450'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => {},
                          icon: const Icon(
                            Icons.remove_rounded,
                            color: Colors.tealAccent,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15),
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: const Icon(
                            Icons.add_rounded,
                            color: Colors.teal,
                          ),
                        ),
                      ],
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

class Costing extends StatelessWidget {
  final String text;
  final String cost;
  const Costing({
    Key? key,
    required this.text,
    required this.cost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        Flexible(
          child: Text(
            cost,
            overflow: TextOverflow.visible,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
