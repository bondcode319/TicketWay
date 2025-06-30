import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_ticketing_app/models/trip.dart';

class TripService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Trip _fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    return Trip(
      id: doc.id,
      routeId: data?['routeId'] ?? '',
      departureTime:
          (data?['departureTime'] as Timestamp?)?.toDate() ?? DateTime.now(),
      arrivalTime:
          (data?['arrivalTime'] as Timestamp?)?.toDate() ?? DateTime.now(),
      busId: data?['busId'] ?? '',
      driverId: data?['driverId'] ?? '',
      availableSeats: (data?['availableSeats'] ?? 0) as int,
      price: (data?['price'] ?? 0.0).toDouble(),
      busDetails: data?['busDetails'],
      routeDetails: data?['routeDetails'],
    );
  }

  Stream<List<Trip>> getTripsByRoute(String routeId) {
    return _firestore
        .collection('trips')
        .where('routeId', isEqualTo: routeId)
        .where('departureTime', isGreaterThan: DateTime.now())
        .orderBy('departureTime')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => _fromFirestore(doc)).toList(),
        );
  }

  Stream<List<Trip>> getTripsByDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return _firestore
        .collection('trips')
        .where('departureTime', isGreaterThanOrEqualTo: startOfDay)
        .where('departureTime', isLessThan: endOfDay)
        .orderBy('departureTime')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => _fromFirestore(doc)).toList(),
        );
  }

  Future<Trip?> getTripById(String tripId) async {
    final doc = await _firestore.collection('trips').doc(tripId).get();
    if (doc.exists) {
      return _fromFirestore(doc);
    }
    return null;
  }

  Future<void> updateAvailableSeats(String tripId, int change) async {
    await _firestore.collection('trips').doc(tripId).update({
      'availableSeats': FieldValue.increment(change),
    });
  }

  Stream<List<Trip>> searchTrips({
    required String origin,
    required String destination,
    required DateTime date,
  }) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return _firestore
        .collection('trips')
        .where('departureTime', isGreaterThanOrEqualTo: startOfDay)
        .where('departureTime', isLessThan: endOfDay)
        .orderBy('departureTime')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => _fromFirestore(doc)).toList(),
        );
  }
}
