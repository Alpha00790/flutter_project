import 'package:flutter/material.dart';
import 'package:project/models_and_providers/my_theme.dart';
// import 'package:project/providers/my_theme.dart';
import 'package:project/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/User-screen';
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  double top = 0;
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            // scrollBehavior: ,
            // scrollDirection: Axis.vertical,
            slivers: [
              SliverAppBar(
                pinned: true,
                stretch: true,
                expandedHeight: 250,
                flexibleSpace: LayoutBuilder(builder: (ctx, cons) {
                  top = cons.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    background: Image.network(
                      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b9efbc15-761b-4eb1-818f-a87f60753ce6/dd1zbnp-ef451a3c-89f6-4789-ac1c-f319e9eb1d7a.jpg/v1/fill/w_1280,h_531,q_75,strp/dark_city_by_jordangrimmer_dd1zbnp-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTMxIiwicGF0aCI6IlwvZlwvYjllZmJjMTUtNzYxYi00ZWIxLTgxOGYtYTg3ZjYwNzUzY2U2XC9kZDF6Ym5wLWVmNDUxYTNjLTg5ZjYtNDc4OS1hYzFjLWYzMTllOWViMWQ3YS5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.91BhbbaslutCXow38y5F6A8uHDhzOP3Dg1iziTrLTDw',
                      fit: BoxFit.cover,
                    ),
                    title: AnimatedOpacity(
                      duration: Duration(microseconds: 300),
                      opacity: top <= 200 ? 1 : 0,
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 12,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://scontent.fzyl1-1.fna.fbcdn.net/v/t1.6435-9/148547106_2748387072138185_4322606082136142118_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeEilSvfkrh3K0NVRdWCKl5nkeLgR3j9RAOR4uBHeP1EA1SlSOlJumvsYz4mt_ZobHhsjKR3CBXhtw4LNi3Vn1n_&_nc_ohc=kKsO0LQlN0sAX9D9vPS&_nc_ht=scontent.fzyl1-1.fna&oh=00_AT-xx3lCTGZDIf0zhhoyH0fv2yoZlceMl1J8CiasF_HUIg&oe=621B4F18'),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text("Shaikat Barua")
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      // User Bag
                      const UserTileText(
                        text: 'User Bag',
                      ),
                      const UserTileHeightSpace(
                        height: 15,
                      ),
                      UserListTile(
                        onTap: () => {
                          Navigator.of(context)
                              .pushNamed(WishListScreen.routeName),
                        },
                        lIcon: Icons.favorite,
                        color: Colors.redAccent,
                        title: "Wishlist",
                        tIcon: Icons.arrow_forward_ios_rounded,
                        tIconCallBack: () => {},
                      ),
                      UserListTile(
                        onTap: () => {},
                        lIcon: Icons.shopping_cart_rounded,
                        color: Colors.deepPurpleAccent,
                        title: "Cart",
                        tIcon: Icons.arrow_forward_ios_rounded,
                        tIconCallBack: () => {},
                      ),
                      // User Settings
                      const UserTileHeightSpace(height: 15),
                      const UserTileText(text: 'User Settings'),
                      const UserTileHeightSpace(height: 15),

                      Card(
                        child: Consumer<ThemeNotifier>(
                            // stream: null,
                            builder: (context, notifier, _) {
                          return SwitchListTile.adaptive(
                              secondary: notifier.isDark
                                  ? const Icon(
                                      Icons.dark_mode_rounded,
                                      color: Colors.amberAccent,
                                    )
                                  : const Icon(
                                      Icons.light_mode_rounded,
                                      color: Colors.amberAccent,
                                    ),
                              title: notifier.isDark
                                  ? const Text('Dark Mode')
                                  : const Text('Light Mode'),
                              value: notifier.isDark,
                              onChanged: (value) {
                                notifier.toggleTheme(value);
                              });
                        }),
                      ),
                      // User Information
                      const UserTileHeightSpace(height: 15),
                      const UserTileText(text: 'User Information'),
                      const UserTileHeightSpace(height: 15),
                      UserListTile(
                        lIcon: Icons.email,
                        color: Colors.deepOrangeAccent,
                        title: 'Email',
                        subtitle: 'Email',
                        onTap: () => {},
                      ),
                      UserListTile(
                        lIcon: Icons.call,
                        color: Colors.pinkAccent,
                        title: 'Phone Number',
                        subtitle: 'Number',
                        onTap: () => {},
                      ),
                      UserListTile(
                        lIcon: Icons.local_shipping_rounded,
                        color: Colors.lightBlueAccent,
                        title: 'Address',
                        subtitle: 'Address',
                        onTap: () => {},
                      ),
                      const UserListTile(
                        lIcon: Icons.watch_later_rounded,
                        color: Colors.greenAccent,
                        title: 'Join Date',
                        subtitle: 'Date',
                        // onTap: ()=>{},
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          BuildFab()
        ],
      ),
    );
  }

  Widget BuildFab() {
    double defaultMargin = 250;
    double scrollStart = 230;
    double scrollEnd = scrollStart / 2;
    double top = defaultMargin;
    double scale = 1;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultMargin - scrollStart) {
        scale = 1;
      } else if (offset < defaultMargin - scrollEnd) {
        scale = (defaultMargin - scrollEnd - offset) / scrollEnd;
      } else {
        scale = 0;
      }
    }

    return Positioned(
      right: 25,
      top: top,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () => {},
          child: const Icon(Icons.camera),
        ),
      ),
    );
  }
}

class UserListTile extends StatelessWidget {
  final IconData lIcon;
  final Color color;
  final String title;
  final String? subtitle;
  final IconData? tIcon;
  final VoidCallback? tIconCallBack;
  final VoidCallback? onTap;
  const UserListTile(
      {this.subtitle,
      this.tIcon,
      this.tIconCallBack,
      this.onTap,
      Key? key,
      required this.lIcon,
      required this.title,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          lIcon,
          color: color,
        ),
        title: Text(title),
        subtitle: subtitle == null ? null : Text(subtitle!),
        trailing: IconButton(onPressed: tIconCallBack, icon: Icon(tIcon)),
      ),
    );
  }
}

class UserTileHeightSpace extends StatelessWidget {
  final double height;
  const UserTileHeightSpace({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class UserTileText extends StatelessWidget {
  final String text;
  const UserTileText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          // decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
