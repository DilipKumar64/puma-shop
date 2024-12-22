import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:puma_shop/constant.dart';
import 'package:puma_shop/screens/product_page.dart';
import 'package:puma_shop/screens/widgets/my_app_bar.dart';
import 'package:puma_shop/screens/widgets/my_navigation_bar.dart';
import 'package:puma_shop/screens/widgets/search_and_filter.dart';
import 'package:puma_shop/screens/widgets/shoe_color_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  int homeComponentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: const MyNavigationBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const MyAppBar(),
              const SearchAndFilter(),
              // category slider
              _buildCategorySlider(),
              const SizedBox(height: 20),
              // new collection title section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'NEWEST COLLECTION',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'more',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              _buildNewCollectionSection(),
              const SizedBox(height: 20),
              //most popular section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'MOST POPULAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'more',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              // most popular section
              _buildMostPopularSection(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildMostPopularSection() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: productsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Map<String, dynamic> product = productsList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    index: index,
                  ),
                ),
              );
            },
            child: Container(
              height: 100,
              width: 150,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: secondryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.fitHeight,
                      height: 50,
                      width: 140,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 20,
                    child: ListView.builder(
                      itemCount: product['shoeColor'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> colors =
                            product['shoeColor'][index];
                        return ShoeColorIndicator(
                          color2: Color(colors['color2']),
                          color1: Color(colors['color1']),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Expanded _buildNewCollectionSection() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> product = productsList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    index: index,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                children: [
                  Container(
                    height: 220,
                    width: 180,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: secondryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Image.asset(
                          product['image'],
                          height: 50,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product['title'],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          product['type'],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        const Spacer(),
                        RatingBar(
                          filledColor: primaryColor,
                          emptyColor: const Color(0xff8d8d8c),
                          size: 20,
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          onRatingChanged: (value) => debugPrint('$value'),
                          initialRating: 3,
                          maxRating: 5,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Text(
                              '₹',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 16),
                            ),
                            Text(
                              product['price'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            "ADD TO BASKET",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: secondryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.asset(
                          'assets/icons/bookmark.png',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _buildCategorySlider() {
    return SizedBox(
      width: double.maxFinite,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorySliderData.length,
        itemBuilder: (context, index) {
          return Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: secondryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Image.asset(
                  categorySliderData[index]["image"]!,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 5),
                Text(
                  categorySliderData[index]["title"]!,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
