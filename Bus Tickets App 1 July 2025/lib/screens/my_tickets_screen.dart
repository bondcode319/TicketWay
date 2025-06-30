import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bus_ticketing_app/auth/providers/auth_provider.dart';
import 'package:bus_ticketing_app/booking/providers/booking_provider.dart';
import 'package:intl/intl.dart';

class MyTicketsScreen extends ConsumerWidget {
  const MyTicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final ticketsAsync = ref.watch(userTicketsProvider(user?.uid ?? ''));

    return Scaffold(
      appBar: AppBar(title: const Text('My Tickets')),
      body: ticketsAsync.when(
        data: (tickets) {
          if (tickets.isEmpty) {
            return const Center(child: Text('No tickets found'));
          }

          return ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final ticket = tickets[index];
              final tripDetails = ticket.tripDetails ?? {};

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ticket #${ticket.id.substring(0, 8)}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          _buildStatusChip(ticket.ticketStatus),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tripDetails['origin'] ?? 'N/A',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  'From',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  tripDetails['destination'] ?? 'N/A',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  'To',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                DateFormat(
                                  'MMM d, yyyy',
                                ).format(ticket.bookingTime),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Seat',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                ticket.seatNumber,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price: ${ticket.price} UGX',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          _buildPaymentStatusChip(ticket.paymentStatus),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'active':
        color = Colors.green;
        break;
      case 'used':
        color = Colors.blue;
        break;
      case 'cancelled':
        color = Colors.red;
        break;
      case 'expired':
        color = Colors.grey;
        break;
      default:
        color = Colors.grey;
    }

    return Chip(
      label: Text(status, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
    );
  }

  Widget _buildPaymentStatusChip(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'paid':
        color = Colors.green;
        break;
      case 'pending':
        color = Colors.orange;
        break;
      case 'failed':
        color = Colors.red;
        break;
      case 'refunded':
        color = Colors.blue;
        break;
      default:
        color = Colors.grey;
    }

    return Chip(
      label: Text(status, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
    );
  }
}
