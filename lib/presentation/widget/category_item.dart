// Widget for category items (like furniture)
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String itemName;
  final String itemDescription;
  final int itemCount;

  const CategoryItem(this.itemName, this.itemDescription, this.itemCount,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.chair, color: Colors.grey),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemName,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(itemDescription,
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          Text('$itemCount'),
        ],
      ),
    );
  }
}

// Widget for custom items (like the antique clock)
Widget CustomItem(String itemName, String description, String length,
    String width, String height) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5.0),
        Text(itemName, style: const TextStyle(fontSize: 20.0)),
        Text(description, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('L: ${length} ft',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 30.0),
            Text('W: ${width} ft',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 30.0),
            Text('H: ${height} ft',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Divider()
      ],
    ),
  );
}
