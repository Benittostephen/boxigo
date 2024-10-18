import 'package:boxigo/presentation/screen/bottom_nav.dart';
import 'package:boxigo/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/bloc/customer_estimate_bloc.dart';
import 'logic/bloc/customer_estimate_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerEstimateBloc()..add(FetchCustomerEstimates()),
      child: const MaterialApp(
        title: 'Boxigo',
        home: SplashScreen(),
      ),
    );
  }
}
