
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../services/riverpod/dummy_brands.dart';
import './brand_item.dart';

class BrandsScreen extends StatelessWidget {
  final int crossAxisCount;
  final Axis scrollDirection;
  final double height;
  const BrandsScreen({
    Key? key,
    required this.crossAxisCount,
    required this.scrollDirection,
    required this.height,
  }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height,
        child: Consumer(builder: (context, ref, child) {
          final categoryitems = ref.watch(brandModelProvider.notifier);
          return GridView.builder(
            scrollDirection: scrollDirection,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            itemCount: categoryitems.items.length,
            itemBuilder: (context, i) {
              return BrandItem(
                image: categoryitems.items[i].image,
                title: categoryitems.items[i].title,
              );
            },
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 3 / 6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          );
        }),
      ),
    );
  }
}
