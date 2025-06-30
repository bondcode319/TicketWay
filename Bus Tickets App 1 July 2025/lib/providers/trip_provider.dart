import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bus_ticketing_app/models/trip.dart';
import 'package:bus_ticketing_app/services/trip_service.dart';

final tripServiceProvider = Provider<TripService>((ref) {
  return TripService();
});

final selectedTripProvider = StateProvider<Trip?>((ref) => null);

final tripsByRouteProvider =
    StreamProvider.family<List<Trip>, String>((ref, routeId) {
  final tripService = ref.watch(tripServiceProvider);
  return tripService.getTripsByRoute(routeId).handleError((error) {
    throw 'Failed to load trips: ${error.toString()}';
  });
});

final tripsByDateProvider =
    StreamProvider.family<List<Trip>, DateTime>((ref, date) {
  final tripService = ref.watch(tripServiceProvider);
  return tripService.getTripsByDate(date).handleError((error) {
    throw 'Failed to load trips for selected date: ${error.toString()}';
  });
});

final searchTripsProvider = StreamProvider.family<List<Trip>,
    ({String origin, String destination, DateTime date})>((ref, params) {
  final tripService = ref.watch(tripServiceProvider);
  return tripService
      .searchTrips(
    origin: params.origin,
    destination: params.destination,
    date: params.date,
  )
      .handleError((error) {
    throw 'Failed to search trips: ${error.toString()}';
  });
});

final availableSeatsProvider =
    StreamProvider.family<int, String>((ref, tripId) {
  final tripService = ref.watch(tripServiceProvider);
  return Stream.periodic(const Duration(seconds: 30)).asyncMap((_) async {
    final trip = await tripService.getTripById(tripId);
    return trip?.availableSeats ?? 0;
  }).handleError((error) {
    throw 'Failed to get available seats: ${error.toString()}';
  });
});
