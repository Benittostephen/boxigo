import 'package:flutter/material.dart';

import '../../config/constants/const.dart';

class HouseDetailsSection extends StatelessWidget {
  final String title;
  final String floorNo;
  final String elevatorAvailable;
  String? packingRequired;
  String? unPackingRequired;
  final String distanceFromDoor;
  final String additionalInfo;

  HouseDetailsSection({
    super.key,
    required this.title,
    required this.floorNo,
    required this.elevatorAvailable,
    this.packingRequired,
    this.unPackingRequired,
    required this.distanceFromDoor,
    required this.additionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Spacer()
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          InfoRow('Floor No.', floorNo),
          const SizedBox(height: 15.0),
          InfoRow('Elevator Available', elevatorAvailable),
          const SizedBox(height: 15.0),
          InfoRow(
              packingRequired != null
                  ? 'Packing Required'
                  : 'Unpacking Required',
              packingRequired ?? unPackingRequired!),
          const SizedBox(height: 15.0),
          InfoRow('Distance from door to truck', distanceFromDoor),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Additional Information',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: secondaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              additionalInfo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

Widget InfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: secondaryColor)),
        Text(value,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
