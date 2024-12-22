import 'package:flutter/material.dart';

import '../../constant.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
