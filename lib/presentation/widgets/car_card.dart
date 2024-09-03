import 'package:car_rental_app_flutter_bloc/data/models/Car.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback onPressed;

  const CarCard({super.key, required this.car, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/car_image.png',
              height: 120,
            ),
            Text(
              car.model,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/gps.png'),
                        Text('${car.distance.toStringAsFixed(0)}km'),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/pump.png'),
                        Text('${car.fuelCapacity.toStringAsFixed(0)}L'),
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$${car.pricePerHour.toStringAsFixed(2)}/h',
                  style: const TextStyle(
                    fontSize: 16,

                    /// color: Colors.black12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
