import 'package:bloc/bloc.dart';
import 'package:car_rental_app_flutter_bloc/domain/usecases/get_cars.dart';

import 'car_event.dart';
import 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarLoading());
      try {
        final cars = await getCars.call();
        emit(CarLoaded(cars: cars));
      } catch (e) {
        emit(CarError(e.toString()));
      }
    });
  }
}
