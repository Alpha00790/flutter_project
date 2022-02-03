import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:project/models_and_providers/product.dart';
import 'package:project/screens/feeds_screen.dart';
import 'package:project/screens/inner_screens/brands_nav_rail.dart';
import 'package:project/screens/wishlist_screen.dart';
import 'package:project/widgets/back_layer.dart';
import 'package:project/widgets/catetory.dart';
import 'package:project/widgets/popular_products.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/Home-screen';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _carouselImages = [
    Image.asset('assets/images/carousel1.png'),
    Image.asset('assets/images/carousel2.jpeg'),
    Image.asset('assets/images/carousel3.jpeg'),
    Image.asset('assets/images/carousel4.png'),
  ];
  final List _swiperImages = [
    'assets/images/addidas.jpeg',
    'assets/images/apple.jpeg',
    'assets/images/Dell.jpeg',
    'assets/images/h&m.jpeg',
    'assets/images/Huawei.jpeg',
    'assets/images/nike.jpeg',
    'assets/images/samsung.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final popularProduct = productData.popularProducts;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Home Screen"),
      // ),
      body: BackdropScaffold(
        headerHeight: MediaQuery.of(context).size.height * 0.4,
        appBar: BackdropAppBar(
          centerTitle: true,
          title: const Text("Flutter Shop"),
          leading: BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          actions: [
            IconButton(
              onPressed: () =>
                  {Navigator.of(context).pushNamed(WishListScreen.routeName)},
              icon: Icon(Icons.favorite_rounded),
            ),
            IconButton(
              onPressed: () => {},
              icon: CircleAvatar(
                backgroundColor: Colors.cyanAccent,
                child: CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                      'https://scontent.fzyl1-1.fna.fbcdn.net/v/t1.6435-9/135934418_2723017654675127_8203263293009641061_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=299RQG9mH7AAX8ZO6ej&_nc_ht=scontent.fzyl1-1.fna&oh=00_AT_jlSGnvjGc-jEnN2PFmgd59ZW4isjgNCYoT5u3OH74Sw&oe=621A0F90'),
                ),
              ),
            ),
          ],
        ),
        backLayer: BackLayer(),
        frontLayer: ListView(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Carousel(
                images: _carouselImages,
                autoplay: true,
                animationDuration: Duration(seconds: 5),
                animationCurve: Curves.fastOutSlowIn,
                indicatorBgPadding: 7,
                dotSize: 5,
                boxFit: BoxFit.fill,
              ),
            ),
            ShortCutSizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (ctx, i) => Category(
                  i: i,
                ),
              ),
            ),
            ShortCutSizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Brands",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () => {
                      Navigator.of(context)
                          .pushNamed(BrandsNavRailScreen.routName, arguments: 7)
                    },
                    child: const Text("View All"),
                  ),
                ],
              ),
            ),
            ShortCutSizedBox(
              height: 25,
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Swiper(
                  onTap: (index) => Navigator.of(context).pushNamed(
                      BrandsNavRailScreen.routName,
                      arguments: index),
                  viewportFraction: 0.8,
                  scale: 0.9,
                  autoplay: true,
                  itemBuilder: (ctx, i) => Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(
                          _swiperImages[i],
                          fit: BoxFit.contain,
                        ),
                      ),
                  itemCount: _swiperImages.length),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Products",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(FeedsScreen.routeName, arguments: 'Popular'),
                    child: const Text("View All"),
                  ),
                ],
              ),
            ),
            ShortCutSizedBox(
              height: 25,
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularProduct.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: popularProduct[i],
                  child: PopularProducts(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShortCutSizedBox extends StatelessWidget {
  late double height;
  ShortCutSizedBox({
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
