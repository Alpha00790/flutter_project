import 'package:flutter/material.dart';
import 'package:project/models_and_providers/product.dart';
import 'package:project/screens/inner_screens/brands_nav_rail_widget.dart';
import 'package:project/widgets/catetory.dart';
import 'package:provider/provider.dart';

class BrandsNavRailScreen extends StatefulWidget {
  static const routName = '/brands-nav-rail';
  const BrandsNavRailScreen({Key? key}) : super(key: key);

  @override
  _BrandsNavRailScreenState createState() => _BrandsNavRailScreenState();
}

class _BrandsNavRailScreenState extends State<BrandsNavRailScreen> {
  late String routeArgs;
  late String brands;
  int _selectedIndex = 0;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    //
    routeArgs = ModalRoute.of(context)!.settings.arguments.toString();
    _selectedIndex = int.parse(routeArgs.substring(0, 1));

    if (_selectedIndex == 0) {
      setState(() {
        brands = 'Addidas';
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        brands = 'Apple';
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        brands = 'Dell';
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        brands = 'H&M';
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        brands = 'Huawei';
      });
    }
    if (_selectedIndex == 5) {
      setState(() {
        brands = 'Nike';
      });
    }
    if (_selectedIndex == 6) {
      setState(() {
        brands = 'Samsung';
      });
    }
    if (_selectedIndex == 7) {
      setState(() {
        brands = 'All';
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          LayoutBuilder(
            builder: (ctx, cons) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: cons.maxHeight),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    selectedLabelTextStyle: TextStyle(
                        letterSpacing: 2.5,
                        decoration: TextDecoration.underline),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://scontent.fzyl1-1.fna.fbcdn.net/v/t1.6435-9/135934418_2723017654675127_8203263293009641061_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=299RQG9mH7AAX8ZO6ej&_nc_ht=scontent.fzyl1-1.fna&oh=00_AT_jlSGnvjGc-jEnN2PFmgd59ZW4isjgNCYoT5u3OH74Sw&oe=621A0F90'),
                      ),
                    ),
                    labelType: NavigationRailLabelType.all,
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (index) => setState(() {
                      _selectedIndex = index;
                      if (_selectedIndex == 0) {
                        setState(() {
                          brands = 'Addidas';
                        });
                      }
                      if (_selectedIndex == 1) {
                        setState(() {
                          brands = 'Apple';
                        });
                      }
                      if (_selectedIndex == 2) {
                        setState(() {
                          brands = 'Dell';
                        });
                      }
                      if (_selectedIndex == 3) {
                        setState(() {
                          brands = 'H&M';
                        });
                      }
                      if (_selectedIndex == 4) {
                        setState(() {
                          brands = 'Huawei';
                        });
                      }
                      if (_selectedIndex == 5) {
                        setState(() {
                          brands = 'Nike';
                        });
                      }
                      if (_selectedIndex == 6) {
                        setState(() {
                          brands = 'Samsung';
                        });
                      }
                      if (_selectedIndex == 7) {
                        setState(() {
                          brands = 'All';
                        });
                      }
                    }),
                    destinations: [
                      _navRAilRotatedBox('Addidas'),
                      _navRAilRotatedBox('Apple'),
                      _navRAilRotatedBox('Dell'),
                      _navRAilRotatedBox('H&M'),
                      _navRAilRotatedBox('Huawei'),
                      _navRAilRotatedBox('Nike'),
                      _navRAilRotatedBox('Samsung'),
                      _navRAilRotatedBox('All'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ContentSpace(brand: brands),
        ],
      ),
    );
  }

  NavigationRailDestination _navRAilRotatedBox(String cName) {
    return NavigationRailDestination(
      icon: const Icon(null),
      label: RotatedBox(
        quarterTurns: 3,
        child: Text(cName),
      ),
    );
  }
}

class ContentSpace extends StatelessWidget {
  final String brand;
  const ContentSpace({required this.brand, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final productBrand = productData.getByBrandName(brand);
    if (brand == 'All') {
      for (int i = 0; i < productData.products().length; i++) {
        productBrand.add(productData.products()[i]);
      }
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: ListView.builder(
              itemCount: productBrand.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: productBrand[i],
                child: BrandNavRailWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
