import 'package:flutter/material.dart';
import 'package:puma_shop/constant.dart';
import 'package:puma_shop/screens/widgets/shoe_color_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _buildMyNavBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // app bar
              _buildAppBar(),
              const SizedBox(height: 10),
              // search filed with filter icon
              _buildSearchAndFilter(),
              const SizedBox(height: 20),
              // category slider
              _buildCategorySlider(),
              const SizedBox(height: 20),
              // new collection title section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'NEWEST COLLECTION',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                  )
                ],
              ),
              const SizedBox(height: 20),
              // new collection section
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> product = productsList[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        children: [
                          Container(
                            height: 220,
                            width: 180,
                            decoration: BoxDecoration(
                              color: secondryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(product['image']),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
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
                    );
                  },
                ),
              ),
              // const SizedBox(height: 20),
              //most popular section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'MOST POPULAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                  )
                ],
              ),
              // const SizedBox(height: 20),
              // most popular section
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    Map item = productsList[index];
                    return Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 20),
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                        color: secondryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            item['image'],
                            fit: BoxFit.fitWidth,
                            height: 65,
                            width: 150,
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 20,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: item['shoeColor']!.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> colors =
                                    item['shoeColor'][index];
                                return ShoeColorIndicator(
                                  color1: Color(colors['color1']),
                                  color2: Color(colors['color2']),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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

  Row _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: primaryColor,
              isDense: true,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search',
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 30,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/icons/filter.png'),
        )
      ],
    );
  }

  Row _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/icons/menu.png',
          height: 30,
          color: Colors.white,
        ),
        Image.asset(
          'assets/icons/puma.png',
          height: 50,
          color: primaryColor,
        ),
        Image.asset(
          'assets/icons/shopping-bag.png',
          height: 30,
          color: Colors.white,
        ),
      ],
    );
  }

  Container _buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: secondryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(icon: 'assets/icons/house.png', itemIndex: 0),
          _buildNavBarItem(icon: 'assets/icons/compass.png', itemIndex: 1),
          _buildNavBarItem(icon: 'assets/icons/shopping-bag.png', itemIndex: 2),
          _buildNavBarItem(icon: 'assets/icons/bookmark.png', itemIndex: 3),
          _buildNavBarItem(icon: 'assets/icons/user.png', itemIndex: 4),
        ],
      ),
    );
  }

  InkWell _buildNavBarItem({required int itemIndex, required String icon}) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: pageIndex == itemIndex ? primaryColor : null,
        ),
        child: IconButton(
          onPressed: () {
            setState(() {
              pageIndex = itemIndex;
            });
          },
          icon: ImageIcon(
            AssetImage(icon),
            color: pageIndex == itemIndex ? backgroundColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
