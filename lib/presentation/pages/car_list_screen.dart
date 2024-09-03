import 'package:car_rental_app_flutter_bloc/data/models/Car.dart';
import 'package:car_rental_app_flutter_bloc/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  ///CarListScreen({super.key});

  final List<Car> cars = [
    Car(
        model: 'Fortuner GR',
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    Car(
        model: 'Wolswagen BR',
        distance: 550,
        fuelCapacity: 25,
        pricePerHour: 15),
    Car(model: 'Mercedes S', distance: 290, fuelCapacity: 10, pricePerHour: 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
