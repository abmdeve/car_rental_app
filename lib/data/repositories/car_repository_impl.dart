import 'package:car_rental_app_flutter_bloc/data/datasource/firebase_car_data_source.dart';
import 'package:car_rental_app_flutter_bloc/data/models/Car.dart';
import 'package:car_rental_app_flutter_bloc/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() async {
    // TODO: implement fetchCars
    return await dataSource.getCars();
  }
}
