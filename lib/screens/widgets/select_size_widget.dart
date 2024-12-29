import 'package:flutter/material.dart';

import '../../constant.dart';

class SelectSizeWidget extends StatefulWidget {
  const SelectSizeWidget({
    super.key,
  });

  @override
  State<SelectSizeWidget> createState() => _SelectSizeWidgetState();
}

class _SelectSizeWidgetState extends State<SelectSizeWidget> {
  List<double> sizeList = [6, 7, 8, 9, 10, 10.5, 11];
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          // alignment: Alignment.center,
          children: [
            Positioned(
              top: 5,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondryColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                sizeList.length,
                (index) {
                  double value = sizeList[index];
                  String displayText = value % 1 == 0
                      ? value.toInt().toString()
                      : value.toString();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedIndex == index
                                  ? primaryColor
                                  : secondryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        displayText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
