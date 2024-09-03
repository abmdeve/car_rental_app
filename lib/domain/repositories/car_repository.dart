import 'package:car_rental_app_flutter_bloc/data/models/Car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}
