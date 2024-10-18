import 'package:flutter/material.dart';

import '../../../config/constants/const.dart';
import '../../../data/models/customer_estimate_data_model.dart';
import '../../widget/category_item.dart';

class ItemsTab extends StatelessWidget {
  final CustomerEstimateFlow estimateFlow;

  const ItemsTab({super.key, required this.estimateFlow});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> categoryIcons = {
      'Sofa': 'assets/icons/armchair.png',
      'Table': 'assets/icons/table.png',
      'Chair': 'assets/icons/chair.png',
      'Cot': 'assets/icons/cot.png',
      'Mattress': 'assets/icons/mattress.png',
      'Cupboard': 'assets/icons/kitchen-shelves.png',
      'Misc.': 'assets/icons/ingredients.png',
    };
    final Map<String, String> categoryIcons1 = {
      'TV': 'assets/icons/tv.png',
      'Refrigerator': 'assets/icons/refrigerator.png',
      'Washing Machine': 'assets/icons/washing-machine.png',
      'Air conditioner': 'assets/icons/air-conditioner.png',
      'Misc.': 'assets/icons/ingredients.png',
      'Oven': 'assets/icons/microwave.png',
      'Fans/Coolers': 'assets/icons/fan.png',
    };

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Living Room Category
                ExpansionTile(
                  backgroundColor: Colors.white,
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  minTileHeight: 50,
                  collapsedBackgroundColor: Colors.grey[200],
                  initiallyExpanded: true,
                  title: Text(
                    'Living Room',
                    style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    // ListView with shrinkWrap to make height dynamic
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final items = estimateFlow.items.inventory[0];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                items.displayName,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            // Category items under the main title
                            ListView.builder(
                              shrinkWrap: true,
                              // Make height of inner ListView dynamic
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: items.category.length,
                              itemBuilder: (context, index) {
                                final category = items.category[index];
                                Object categoryIcon =
                                    categoryIcons[category.displayName] ??
                                        Icons.category;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      leading: Image.asset(
                                        categoryIcon.toString(),
                                        height: 25,
                                      ),
                                      title: Text(
                                        category.displayName,
                                        style: TextStyle(color: secondaryColor),
                                      ),
                                      subtitle: Text(
                                        category.items.first.typeOptions
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Text(
                                          category.items.first.qty.toString()),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),

                // Bedroom Category
                ExpansionTile(
                  backgroundColor: Colors.white,
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  minTileHeight: 50,
                  collapsedBackgroundColor: Colors.grey[200],
                  title: Text(
                    'Bed Room',
                    style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    // ListView with shrinkWrap to make height dynamic
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final items = estimateFlow.items.inventory[1];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                items.displayName,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            // Category items under the main title
                            ListView.builder(
                              shrinkWrap: true,
                              // Make height of inner ListView dynamic
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: items.category.length,
                              itemBuilder: (context, index) {
                                final category = items.category[index];
                                Object categoryIcon =
                                    categoryIcons1[category.displayName] ??
                                        Icons.category;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      leading: Image.asset(
                                        categoryIcon.toString(),
                                        height: 25,
                                      ),
                                      title: Text(
                                        category.displayName,
                                        style: TextStyle(color: secondaryColor),
                                      ),
                                      subtitle: Text(
                                        category.items.first.typeOptions
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Text(
                                          category.items.first.qty.toString()),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),

                // Custom Items Category
                ExpansionTile(
                  backgroundColor: Colors.white,
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  minTileHeight: 50,
                  collapsedBackgroundColor: Colors.grey[200],
                  title: Text(
                    'Custom Items',
                    style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: estimateFlow.items.customItems.items.length,
                        itemBuilder: (context, index) {
                          final item =
                              estimateFlow.items.customItems.items.first;
                          return CustomItem(item.itemName, item.itemDescription,
                              item.itemLength, item.itemWidth, item.itemHeight);
                        })
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

Widget listTile(IconData icon, String categoryName, String types) {
  return ListTile(
    leading: Icon(icon),
    title: Text(categoryName),
    subtitle: Text(types),
  );
}
