import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../models/booking.dart';
import '../models/payment.dart';

class NotificationService {
  late FlutterLocalNotificationsPlugin _notificationsPlugin;

  NotificationService() {
    _notificationsPlugin = FlutterLocalNotificationsPlugin();
  }

  // Allow setting the plugin instance (used for testing)
  void setPlugin(FlutterLocalNotificationsPlugin plugin) {
    _notificationsPlugin = plugin;
  }

  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );
  }

  void _onNotificationTapped(NotificationResponse response) {
    // Handle notification tap events here
    // You might want to navigate to a specific screen based on the payload
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'default_channel',
        'Default Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> showBookingConfirmation(Booking booking,
      {required String ticketId}) async {
    await showNotification(
      id: 1,
      title: 'Booking Confirmed',
      body:
          'Your booking has been confirmed for ${booking.service} on ${_formatDate(booking.date)}.',
      payload: booking.id,
    );
  }

  Future<void> showPaymentConfirmation(Payment payment) async {
    await showNotification(
      id: 2,
      title: 'Payment Successful',
      body:
          'Payment of \$${payment.amount.toStringAsFixed(2)} has been processed successfully.',
      payload: payment.id,
    );
  }

  Future<void> showTripReminder({
    required String ticketId,
    required String origin,
    required String destination,
    required String departureTime,
  }) async {
    await showNotification(
      id: 3,
      title: 'Trip Reminder',
      body: 'Your trip from $origin to $destination departs at $departureTime',
      payload: ticketId,
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
