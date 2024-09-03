import 'package:car_rental_app_flutter_bloc/data/models/Car.dart';
import 'package:car_rental_app_flutter_bloc/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}
