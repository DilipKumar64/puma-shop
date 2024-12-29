import 'package:flutter/material.dart';

import '../../constant.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
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
