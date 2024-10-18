import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../config/constants/const.dart';
import '../../../logic/bloc/customer_estimate_bloc.dart';
import '../../../logic/bloc/customer_estimate_state.dart';
import '../view_details.dart';

class NewTab extends StatelessWidget {
  const NewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<CustomerEstimateBloc, CustomerEstimateState>(
        builder: (context, state) {
          if (state is CustomerEstimateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CustomerEstimateLoaded) {
            return ListView.builder(
              itemCount: state.customerEstimates.length,
              itemBuilder: (context, index) {
                final estimateFlow = state.customerEstimates[index];
                DateTime dateTime =
                    DateTime.parse(estimateFlow.movingOn.toString());

                // Extract month, date, and time
                String month = DateFormat('MMM').format(dateTime);
                String date = DateFormat('dd').format(dateTime);
                String time = DateFormat('HH:mm').format(dateTime);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  month,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  date,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                ),
                                Text(
                                  time,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.7)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 13),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      estimateFlow.fromAddress.fromCity,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    const Spacer(),
                                    Text(
                                      estimateFlow.estimateId,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    estimateFlow.fromAddress.fromAddress,
                                    style: TextStyle(color: secondaryColor),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/icons/down-arrow.png',
                                      height: 50,
                                      color: primaryColor,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          iconAndText('assets/icons/home.png',
                                              estimateFlow.propertySize),
                                          iconAndText('assets/icons/box.png',
                                              '${estimateFlow.totalItems} items'),
                                          iconAndText(
                                              'assets/icons/shipping.png',
                                              '20 boxes'.toString()),
                                          iconAndText(
                                              'assets/icons/distance.png',
                                              estimateFlow.distance),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  estimateFlow.toAddress.toCity,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                                const SizedBox(height: 5.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    estimateFlow.toAddress.toAddress,
                                    style: TextStyle(color: secondaryColor),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Material(
                                        color: Colors.white,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewDetails(
                                                            estimate:
                                                                estimateFlow)));
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                                border: Border.all(
                                                    color: primaryColor)),
                                            child: Text(
                                              'View Details',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: primaryColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Expanded(
                                      child: Material(
                                        color: primaryColor,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                                border: Border.all(
                                                    color: primaryColor)),
                                            child: const Text(
                                              'Submit Quote',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: secondaryColor,
                    )
                  ],
                );
              },
            );
          } else if (state is CustomerEstimateError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

Column iconAndText(icon, text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(icon, color: primaryColor, height: 20),
      Text(
        text,
        textAlign: TextAlign.end,
        style: const TextStyle(fontSize: 14),
      )
    ],
  );
}
