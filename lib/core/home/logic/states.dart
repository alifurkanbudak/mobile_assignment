import 'package:mobile_assignment/core/home/models/vehicle_search_result.dart';

class HomeState {}

class HomeDataState extends HomeState {
  HomeDataState({
    required this.searchResult,
  });

  final VehicleSearchResult searchResult;
}

class HomeErrorState extends HomeState {
  HomeErrorState({
    required this.error,
  });

  final Error error;
}
