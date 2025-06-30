import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:bus_ticketing_app/models/trip.dart';
import 'package:bus_ticketing_app/providers/trip_provider.dart';
import 'package:bus_ticketing_app/booking/screens/booking_screen.dart';
import 'package:bus_ticketing_app/widgets/loading_view.dart';
import 'package:bus_ticketing_app/widgets/error_view.dart';

class SearchRoutesScreen extends ConsumerWidget {
  final String origin;
  final String destination;
  final DateTime date;

  const SearchRoutesScreen({
    Key? key,
    required this.origin,
    required this.destination,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsync = ref.watch(searchTripsProvider((
      origin: origin,
      destination: destination,
      date: date,
    )));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Trips'),
      ),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: tripsAsync.when(
              data: (trips) => trips.isEmpty
                  ? _buildEmptyState(context)
                  : _buildTripsList(context, ref, trips),
              loading: () =>
                  const LoadingView(message: 'Finding available trips...'),
              error: (error, stack) => ErrorView(
                message: error.toString(),
                onRetry: () => ref.invalidate(searchTripsProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(origin,
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('From', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(destination,
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('To', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Date: ${DateFormat('EEE, MMM d').format(date)}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.directions_bus_outlined,
              size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'No trips available for this route and date',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Try different dates'),
          ),
        ],
      ),
    );
  }

  Widget _buildTripsList(
      BuildContext context, WidgetRef ref, List<Trip> trips) {
    return ListView.builder(
      itemCount: trips.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => TripCard(trip: trips[index]),
    );
  }
}

class TripCard extends ConsumerWidget {
  final Trip trip;

  const TripCard({
    Key? key,
    required this.trip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final busDetails = trip.busDetails ?? {};
    final availableSeats = ref.watch(availableSeatsProvider(trip.id));

    return Card(
      child: InkWell(
        onTap: () {
          ref.read(selectedTripProvider.notifier).state = trip;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookingScreen(trip: trip)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('HH:mm').format(trip.departureTime),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        DateFormat('EEE, MMM d').format(trip.departureTime),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('HH:mm').format(trip.arrivalTime),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        DateFormat('EEE, MMM d').format(trip.arrivalTime),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              availableSeats.when(
                data: (seats) => Text(
                  'Available Seats: $seats',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                loading: () => const Text('Checking available seats...'),
                error: (_, __) => const Text('Unable to check seats'),
              ),
              Text(
                'Bus ${busDetails['busNumber'] ?? 'N/A'}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration: ${trip.arrivalTime.difference(trip.departureTime).inHours}h ${trip.arrivalTime.difference(trip.departureTime).inMinutes % 60}m',
                  ),
                  Text(
                    'UGX ${(trip.routeDetails?['fare'] ?? 0).toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
    );
  }
}
