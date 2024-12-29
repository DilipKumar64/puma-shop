import 'package:flutter/material.dart';
import 'package:puma_shop/constant.dart';
import 'package:puma_shop/screens/widgets/color_and_price_row.dart';
import 'package:puma_shop/screens/widgets/my_app_bar.dart';
import 'package:puma_shop/screens/widgets/my_icon_button.dart';
import 'package:puma_shop/screens/widgets/my_navigation_bar.dart';
import 'package:puma_shop/screens/widgets/product_images.dart';
import 'package:puma_shop/screens/widgets/product_name_and_rating.dart';
import 'package:puma_shop/screens/widgets/search_and_filter.dart';
import 'package:puma_shop/screens/widgets/select_size_widget.dart';
import 'package:puma_shop/screens/widgets/show_colors_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.index});
  final int index;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> product = productsList[widget.index];
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(),
              const SearchAndFilter(),
              ProductNameAndRating(productName: product['title']),
              const SizedBox(height: 20),
              ProductImages(
                mainImage: product['image'],
                subImages: product['subImages'],
              ),
              const SizedBox(height: 20),
              ColorAndPriceRow(price: product['price']),
              const SizedBox(height: 10),
              ShoeColorsWidget(
                colors: product['shoeColor'],
                size: 30,
              ),
              const SizedBox(height: 20),
              const Text(
                'SIZE',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              const SelectSizeWidget(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 220,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "ADD TO BASKET",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 5),
                        Image.asset(
                          'assets/icons/shopping-bag.png',
                          height: 25,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(),
                  const MyIconButton(iconPath: 'assets/icons/bookmark.png'),
                  const MyIconButton(iconPath: 'assets/icons/favorite.png')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
