import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/Search-screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search Screen"),
      ),
    );
  }
}
