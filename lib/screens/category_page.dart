import 'package:flutter/material.dart';
import 'package:puma_shop/constant.dart';
import 'package:puma_shop/screens/widgets/my_app_bar.dart';
import 'package:puma_shop/screens/widgets/my_navigation_bar.dart';
import 'package:puma_shop/screens/widgets/search_and_filter.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavigationBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const MyAppBar(),
            const SearchAndFilter(),
            Text(
              widget.categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: secondryColor,
                        ),
                      ),
                      Expanded(
                        child: Column(),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
