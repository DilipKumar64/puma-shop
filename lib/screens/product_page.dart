import 'package:flutter/material.dart';
import 'package:puma_shop/constant.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.index});
  final int index;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(children: []),
    );
  }
}
