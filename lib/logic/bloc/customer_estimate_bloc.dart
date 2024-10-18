import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../config/constants/const.dart';
import '../../data/models/customer_estimate_data_model.dart';
import 'customer_estimate_event.dart';
import 'customer_estimate_state.dart';

class CustomerEstimateBloc
    extends Bloc<CustomerEstimateEvent, CustomerEstimateState> {
  CustomerEstimateBloc() : super(CustomerEstimateInitial()) {
    on<FetchCustomerEstimates>(
        _onFetchCustomerEstimates); // Register the event handler here
  }

  Future<void> _onFetchCustomerEstimates(
    FetchCustomerEstimates event,
    Emitter<CustomerEstimateState> emit,
  ) async {
    emit(CustomerEstimateLoading());
    try {
      final url = Uri.parse(CUSTOMER_ESTIMATE_URL);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final customerEstimates =
            CustomerEstimateData.fromJson(data).customerEstimateFlow;
        emit(CustomerEstimateLoaded(customerEstimates));
      } else {
        emit(CustomerEstimateError("Failed to load data"));
      }
    } catch (e) {
      emit(CustomerEstimateError("Error: ${e.toString()}"));
    }
  }
}
