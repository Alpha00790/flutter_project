import 'package:flutter/material.dart';
import 'package:project/models_and_providers/product.dart';
// import 'package:project/providers/my_theme.dart';
import 'package:project/screens/bottom_nav_screen.dart';
import 'package:project/screens/cart_screen.dart';
import 'package:project/screens/feeds_screen.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/inner_screens/brands_nav_rail.dart';
import 'package:project/screens/inner_screens/categories_feed_screen.dart';
import 'package:project/screens/inner_screens/product_details_screen.dart';
import 'package:project/screens/search_screen.dart';
import 'package:project/screens/user_screen.dart';
import 'package:project/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

import 'models_and_providers/my_theme.dart';

// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: Consumer<ThemeNotifier>(
          // stream: null,
          builder: (context, notifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const BottomNavScreen(),
          theme: MyAppTheme.myThemes(notifier.isDark, context),
          routes: {
            BottomNavScreen.routeName: (ctx) => const BottomNavScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            FeedsScreen.routeName: (ctx) => FeedsScreen(),
            SearchScreen.routeName: (ctx) => const SearchScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),
            UserScreen.routeName: (ctx) => const UserScreen(),
            BrandsNavRailScreen.routName: (ctx) => const BrandsNavRailScreen(),
            WishListScreen.routeName: (ctx) => const WishListScreen(),
            ProductDetailsScreen.routeName: (ctx) =>
                const ProductDetailsScreen(),
            CategoriesFeedsScreen.routeName: (ctx) =>
                const CategoriesFeedsScreen()
          },
        );
      }),
    );
  }
}
