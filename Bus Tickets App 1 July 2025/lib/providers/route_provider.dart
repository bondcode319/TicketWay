import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bus_ticketing_app/models/route.dart';

final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final routesCollectionProvider = Provider<CollectionReference>((ref) {
  return ref.watch(firebaseFirestoreProvider).collection('routes');
});

final popularRoutesProvider = StreamProvider<List<BusRoute>>((ref) {
  return ref
      .watch(routesCollectionProvider)
      .orderBy('bookingCount', descending: true)
      .limit(5)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => BusRoute.fromFirestore(doc)).toList(),
      );
});

final routeSearchProvider = Provider.family<Stream<List<BusRoute>>, String>((
  ref,
  searchTerm,
) {
  if (searchTerm.isEmpty) {
    return Stream.value([]);
  }

  return ref
      .watch(routesCollectionProvider)
      .where('origin', isGreaterThanOrEqualTo: searchTerm)
      .where('origin', isLessThan: searchTerm + 'z')
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => BusRoute.fromFirestore(doc)).toList(),
      );
});
