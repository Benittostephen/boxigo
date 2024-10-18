import 'package:flutter/material.dart';

import '../../../data/models/customer_estimate_data_model.dart';
import '../../widget/house_detail.dart';

class FloreInfoTab extends StatelessWidget {
  final CustomerEstimateFlow estimateFlow;

  const FloreInfoTab({super.key, required this.estimateFlow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: Column(
            children: [
              // Existing House Details Section
              HouseDetailsSection(
                title: 'Existing house details',
                floorNo: estimateFlow.newFloorNo,
                elevatorAvailable: estimateFlow.oldElevatorAvailability,
                packingRequired: estimateFlow.packingService,
                distanceFromDoor: estimateFlow.oldParkingDistance,
                additionalInfo:
                    'Dog is available so please call once you reach',
              ),
              const SizedBox(height: 10.0),

              // New House Details Section
              HouseDetailsSection(
                title: 'New house details',
                floorNo: estimateFlow.newFloorNo,
                elevatorAvailable: estimateFlow.newElevatorAvailability,
                unPackingRequired: estimateFlow.unpackingService,
                distanceFromDoor: estimateFlow.newParkingDistance,
                additionalInfo:
                    'Dog is available so please call once you reach',
              ),
              const SizedBox(height: 10.0)
            ],
          ),
        ),
      ),
    );
  }
}
