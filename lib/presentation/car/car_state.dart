import '../../data/models/Car.dart';

abstract class CarState {}

class CarLoading extends CarState {}

class CarLoaded extends CarState {
  final List<Car> cars;

  CarLoaded({required this.cars});
}

class CarError extends CarState {
  final String message;

  CarError(this.message);
}
