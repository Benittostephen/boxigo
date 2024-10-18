import 'package:boxigo/presentation/screen/tabs/new_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Leads',
            style: GoogleFonts.roboto(),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(
              'assets/images/12.png',
              scale: 3.5,
            ),
          ),
          actions: [
            GestureDetector(
              child: Image.asset('assets/icons/active.png', height: 20),
            ),
            const SizedBox(width: 10.0),
            GestureDetector(
              child: const Icon(Icons.search_rounded),
            ),
            const SizedBox(width: 10)
          ],
          titleSpacing: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelStyle: GoogleFonts.roboto(fontSize: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            indicatorWeight: 3.0,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'New'),
              Tab(text: 'Follow Up'),
              Tab(text: 'Booked'),
              Tab(text: 'In Transit'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DemoPage('All Content'),
            const NewTab(),
            DemoPage('Follow Up Content'),
            DemoPage('Booked Content'),
            DemoPage('In Transit Content'),
            DemoPage('Completed Content'),
          ],
        ),
      ),
    );
  }
}

Widget DemoPage(String name) {
  return Container(color: Colors.white, child: Center(child: Text(name)));
}
