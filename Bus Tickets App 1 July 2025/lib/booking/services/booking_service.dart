import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_ticketing_app/models/ticket.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Ticket> createTicket({
    required String userId,
    required String tripId,
    required double price,
    required String seatNumber,
    required Map<String, dynamic> tripDetails,
    required Map<String, dynamic> passengerDetails,
  }) async {
    final ticketRef = _firestore.collection('tickets').doc();

    final ticket = Ticket(
      id: ticketRef.id,
      userId: userId,
      tripId: tripId,
      bookingTime: DateTime.now(),
      price: price,
      paymentStatus: 'Pending',
      paymentMethod: '',
      ticketStatus: 'Active',
      seatNumber: seatNumber,
      tripDetails: tripDetails,
      passengerDetails: passengerDetails,
    );

    await ticketRef.set(ticket.toMap());
    return ticket;
  }

  Future<void> updatePaymentStatus({
    required String ticketId,
    required String paymentStatus,
    required String paymentMethod,
  }) async {
    await _firestore.collection('tickets').doc(ticketId).update({
      'paymentStatus': paymentStatus,
      'paymentMethod': paymentMethod,
    });
  }

  Future<void> cancelTicket(String ticketId) async {
    await _firestore.collection('tickets').doc(ticketId).update({
      'ticketStatus': 'Cancelled',
    });
  }

  Stream<List<Ticket>> getUserTickets(String userId) {
    return _firestore
        .collection('tickets')
        .where('userId', isEqualTo: userId)
        .orderBy('bookingTime', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Ticket.fromFirestore(doc)).toList(),
        );
  }

  Future<bool> isSeatAvailable(String tripId, String seatNumber) async {
    final querySnapshot = await _firestore
        .collection('tickets')
        .where('tripId', isEqualTo: tripId)
        .where('seatNumber', isEqualTo: seatNumber)
        .where('ticketStatus', isEqualTo: 'Active')
        .get();

    return querySnapshot.docs.isEmpty;
  }

  Stream<List<String>> getBookedSeats(String tripId) {
    return _firestore
        .collection('tickets')
        .where('tripId', isEqualTo: tripId)
        .where('ticketStatus', isEqualTo: 'Active')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Ticket.fromFirestore(doc))
            .map((ticket) => ticket.seatNumber)
            .toList());
  }
}
