import 'package:car_rental_app_flutter_bloc/presentation/pages/card_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlng/latlng.dart';

import '../../data/models/Car.dart';

class MapsDetailsScreen extends StatelessWidget {
  final Car car;

  const MapsDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              ///initialCenter:  LatLng(51, -0.09),
              minZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: cardDetailsCard(car: car),
          ),
        ],
      ),
    );
  }
}

Widget cardDetailsCard({required Car car}) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                car.model,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '> ${car.distance} km',
                    style: const TextStyle(
                        fontSize: 14,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.battery_full,
                    color: Colors.white,
                    size: 16,
                  ),
                  Text(
                    car.fuelCapacity.toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Features',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                featuresIcons(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${car.pricePerHour}/day',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
            right: 15,
            child: Image.asset('assets/white_car.png'),
        ),
      ],
    ),
  );
}

Widget featuresIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(
        Icons.local_gas_station,
        'Diesel',
        'Common Rail',
      ),
      featureIcon(
        Icons.speed,
        'Acceleration',
        '0 - 100km/s',
      ),
      featureIcon(
        Icons.ac_unit,
        'Cold',
        'Temp Control',
      ),
    ],
  );
}

Widget featureIcon(IconData icon, String title, String subTitle) {
  return Container(
    width: 100,
    height: 100,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 1),
    ),
    child: Column(
      children: [
        Icon(
          icon,
          size: 28,
        ),
        Text(title),
        Text(
          subTitle,
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        ),
      ],
    ),
  );
}
