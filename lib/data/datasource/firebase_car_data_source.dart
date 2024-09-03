import 'package:car_rental_app_flutter_bloc/data/models/Car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firestore;

  FirebaseCarDataSource({required this.firestore});

  Future<List<Car>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
  return snapshot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
