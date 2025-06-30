import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_ticketing_app/models/route.dart';

class RouteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<BusRoute>> getPopularRoutes() {
    return _firestore
        .collection('routes')
        .orderBy('bookingCount', descending: true)
        .limit(5)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => BusRoute.fromFirestore(doc)).toList(),
        );
  }

  Stream<List<BusRoute>> searchRoutes({
    required String origin,
    required String destination,
  }) {
    Query query = _firestore.collection('routes');

    if (origin.isNotEmpty) {
      query = query
          .where('origin', isGreaterThanOrEqualTo: origin)
          .where('origin', isLessThan: origin + 'z');
    }

    if (destination.isNotEmpty) {
      query = query.where('destination', isEqualTo: destination);
    }

    return query.snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => BusRoute.fromFirestore(doc)).toList(),
    );
  }

  Future<BusRoute?> getRouteById(String routeId) async {
    final doc = await _firestore.collection('routes').doc(routeId).get();
    if (doc.exists) {
      return BusRoute.fromFirestore(doc);
    }
    return null;
  }

  Future<void> incrementBookingCount(String routeId) async {
    await _firestore.collection('routes').doc(routeId).update({
      'bookingCount': FieldValue.increment(1),
    });
  }
}
