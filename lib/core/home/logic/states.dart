class HomeState {}

class HomeErrorState extends HomeState {
  HomeErrorState({
    required this.error,
  });

  final Error error;
}
