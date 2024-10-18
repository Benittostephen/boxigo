import 'package:boxigo/presentation/screen/tabs/flore_info_tab.dart';
import 'package:boxigo/presentation/screen/tabs/items_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/customer_estimate_data_model.dart';

class ViewDetails extends StatelessWidget {
  final CustomerEstimateFlow estimate;

  const ViewDetails({super.key, required this.estimate});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          actions: [
            GestureDetector(
              child: Image.asset('assets/icons/active.png', height: 20),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
              child: Icon(Icons.search_rounded),
            ),
            SizedBox(width: 10)
          ],
          titleSpacing: 0,
          title: Text(
            'New Leads',
            style: GoogleFonts.roboto(),
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: GoogleFonts.roboto(fontSize: 16),
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            indicatorWeight: 3.0,
            tabs: const [
              Tab(text: 'Items'),
              Tab(text: 'Flore Info'),
              Tab(text: 'Send Quote'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ItemsTab(estimateFlow: estimate),
            FloreInfoTab(estimateFlow: estimate),
            Container(
                color: Colors.white,
                child: Center(child: Text('Follow Up Content'))),
          ],
        ),
      ),
    );
  }
}
