import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bus_ticketing_app/models/trip.dart';
import 'package:bus_ticketing_app/booking/providers/booking_provider.dart';
import 'package:bus_ticketing_app/auth/providers/auth_provider.dart';
import 'package:bus_ticketing_app/auth/screens/login_screen.dart';
import 'package:bus_ticketing_app/booking/screens/payment_screen.dart';
import 'package:intl/intl.dart';

class BookingScreen extends ConsumerStatefulWidget {
  final Trip trip;

  const BookingScreen({Key? key, required this.trip}) : super(key: key);

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _proceedToPayment() {
    if (!_formKey.currentState!.validate()) return;

    final selectedSeats = ref.read(selectedSeatsProvider);
    if (selectedSeats.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one seat')),
      );
      return;
    }

    final user = ref.read(currentUserProvider);
    if (user == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      return;
    }

    final passengerDetails = {
      'name': _nameController.text,
      'phone': _phoneController.text,
      'email': _emailController.text,
    };

    ref.read(passengerDetailsProvider.notifier).state = passengerDetails;

    final totalPrice = (selectedSeats.length * widget.trip.price).toDouble();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PaymentScreen(trip: widget.trip, totalAmount: totalPrice),
      ),
    );
  }

  Widget _buildTripDetails() {
    final routeDetails = widget.trip.routeDetails ?? {};
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trip Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        routeDetails['origin'] ?? 'N/A',
                        style: Theme.of(context).textTheme.titleMedium,
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
                        routeDetails['destination'] ?? 'N/A',
                        style: Theme.of(context).textTheme.titleMedium,
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
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Departure',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      DateFormat('HH:mm').format(widget.trip.departureTime),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      DateFormat('EEE, MMM d')
                          .format(widget.trip.departureTime),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Arrival',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      DateFormat('HH:mm').format(widget.trip.arrivalTime),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      DateFormat('EEE, MMM d').format(widget.trip.arrivalTime),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeatLayout() {
    final selectedSeats = ref.watch(selectedSeatsProvider);
    final bookedSeatsAsync = ref.watch(bookedSeatsProvider(widget.trip.id));

    return bookedSeatsAsync.when(
      data: (bookedSeats) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: widget.trip.availableSeats,
        itemBuilder: (context, index) {
          final seatNumber = (index + 1).toString().padLeft(2, '0');
          final isSelected = selectedSeats.contains(seatNumber);
          final isBooked = bookedSeats.contains(seatNumber);

          return GestureDetector(
            onTap: isBooked ? null : () => _toggleSeatSelection(seatNumber),
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isBooked
                    ? Colors.grey
                    : isSelected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  seatNumber,
                  style: TextStyle(
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error loading seats: $error'),
      ),
    );
  }

  void _toggleSeatSelection(String seatNumber) {
    final currentSeats = List<String>.from(ref.read(selectedSeatsProvider));
    if (currentSeats.contains(seatNumber)) {
      currentSeats.remove(seatNumber);
    } else {
      currentSeats.add(seatNumber);
    }
    ref.read(selectedSeatsProvider.notifier).state = currentSeats;
  }

  @override
  Widget build(BuildContext context) {
    final selectedSeats = ref.watch(selectedSeatsProvider);
    final totalPrice = selectedSeats.length * widget.trip.price;

    return Scaffold(
      appBar: AppBar(title: const Text('Book Tickets')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTripDetails(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Seats',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  _buildSeatLayout(),
                  const SizedBox(height: 24),
                  Text(
                    'Passenger Details',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total', style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    'UGX ${totalPrice.toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: selectedSeats.isNotEmpty ? _proceedToPayment : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text('Continue to Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
