import '../../data/models/customer_estimate_data_model.dart';

abstract class CustomerEstimateState {}

class CustomerEstimateInitial extends CustomerEstimateState {}

class CustomerEstimateLoading extends CustomerEstimateState {}

class CustomerEstimateLoaded extends CustomerEstimateState {
  final List<CustomerEstimateFlow> customerEstimates;

  CustomerEstimateLoaded(this.customerEstimates);
}

class CustomerEstimateError extends CustomerEstimateState {
  final String message;

  CustomerEstimateError(this.message);
}
