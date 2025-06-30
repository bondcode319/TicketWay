import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bus_ticketing_app/booking/services/booking_service.dart';
import 'package:bus_ticketing_app/models/ticket.dart';

final bookingServiceProvider = Provider<BookingService>((ref) {
  return BookingService();
});

final userTicketsProvider = StreamProvider.family<List<Ticket>, String>((
  ref,
  userId,
) {
  return ref.watch(bookingServiceProvider).getUserTickets(userId);
});

final selectedSeatsProvider = StateProvider<List<String>>((ref) => []);

final bookingStateProvider = StateProvider<AsyncValue<void>>((ref) {
  return const AsyncValue.data(null);
});

final ticketDetailsProvider = StateProvider<Map<String, dynamic>?>(
  (ref) => null,
);

final passengerDetailsProvider = StateProvider<Map<String, dynamic>?>(
  (ref) => null,
);

final bookedSeatsProvider = StreamProvider.family<List<String>, String>((
  ref,
  tripId,
) {
  return ref.watch(bookingServiceProvider).getBookedSeats(tripId);
});
