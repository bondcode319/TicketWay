import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:bus_ticketing_app/models/trip.dart';
import 'package:bus_ticketing_app/models/payment.dart';
import 'package:bus_ticketing_app/models/booking.dart';
import 'package:bus_ticketing_app/booking/providers/booking_provider.dart';
import 'package:bus_ticketing_app/auth/providers/auth_provider.dart';
import 'package:bus_ticketing_app/services/notification_service.dart';
import 'package:bus_ticketing_app/screens/my_tickets_screen.dart';

class PaymentScreen extends ConsumerWidget {
  final Trip trip;
  final double totalAmount;

  const PaymentScreen({
    Key? key,
    required this.trip,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSeats = ref.watch(selectedSeatsProvider);
    final passengerDetails = ref.watch(passengerDetailsProvider);
    final bookingService = ref.watch(bookingServiceProvider);
    final user = ref.watch(currentUserProvider);
    final notificationService = NotificationService();

    void processPayment(String method) async {
      if (user == null || passengerDetails == null) return;

      try {
        ref.read(bookingStateProvider.notifier).state =
            const AsyncValue.loading();

        // Create a ticket for each selected seat
        for (final seatNumber in selectedSeats) {
          final pricePerSeat = totalAmount / selectedSeats.length;

          final ticket = await bookingService.createTicket(
            userId: user.uid,
            tripId: trip.id,
            price: pricePerSeat,
            seatNumber: seatNumber,
            tripDetails: {
              ...trip.routeDetails ?? {},
              'departureTime': trip.departureTime,
              'arrivalTime': trip.arrivalTime,
              'busDetails': trip.busDetails,
              'driverId': trip.driverId,
            },
            passengerDetails: passengerDetails,
          );

          // Create payment record
          final payment = Payment(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            amount: pricePerSeat,
            status: 'completed',
            method: method,
            timestamp: DateTime.now(),
            ticketId: ticket.id,
          );

          // Show payment confirmation notification
          await notificationService.showPaymentConfirmation(payment);

          // Create booking record
          final booking = Booking(
            id: ticket.id,
            userId: user.uid,
            service: 'Bus Trip',
            date: trip.departureTime,
            status: 'confirmed',
            details: {
              'origin': trip.routeDetails?['origin'],
              'destination': trip.routeDetails?['destination'],
              'seatNumber': seatNumber,
              'price': pricePerSeat,
            },
          );

          // Show booking confirmation notification
          await notificationService.showBookingConfirmation(booking,
              ticketId: ticket.id);

          // Show trip reminder notification
          await notificationService.showTripReminder(
            ticketId: ticket.id,
            origin: trip.routeDetails?['origin'] ?? '',
            destination: trip.routeDetails?['destination'] ?? '',
            departureTime: DateFormat('HH:mm').format(trip.departureTime),
          );
        }

        ref.read(bookingStateProvider.notifier).state =
            const AsyncValue.data(null);

        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyTicketsScreen(),
            ),
          );
        }
      } catch (error) {
        ref.read(bookingStateProvider.notifier).state =
            AsyncValue.error(error, StackTrace.current);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Payment failed: $error')),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Payment Method',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone_android),
                title: const Text('Mobile Money'),
                subtitle: const Text('Pay using MTN or Airtel Money'),
                onTap: () => processPayment('mobile_money'),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.credit_card),
                title: const Text('Credit Card'),
                subtitle: const Text('Pay using Visa or Mastercard'),
                onTap: () => processPayment('credit_card'),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Summary',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Number of Seats'),
                        Text('${selectedSeats.length}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price per Seat'),
                        Text(
                          'UGX ${trip.price.toStringAsFixed(0)}',
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'UGX ${totalAmount.toStringAsFixed(0)}',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
