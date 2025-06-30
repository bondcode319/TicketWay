import 'package:bus_ticketing_app/models/booking.dart';
import 'package:bus_ticketing_app/models/payment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:bus_ticketing_app/services/notification_service.dart';

@GenerateMocks([FlutterLocalNotificationsPlugin])
import 'notification_service_test.mocks.dart';

void main() {
  late NotificationService notificationService;
  late MockFlutterLocalNotificationsPlugin mockNotificationsPlugin;

  setUp(() {
    mockNotificationsPlugin = MockFlutterLocalNotificationsPlugin();
    notificationService = NotificationService();
    // Inject the mock plugin
    notificationService.setPlugin(mockNotificationsPlugin);
  });

  test('initialize should configure notification settings', () async {
    when(mockNotificationsPlugin.initialize(any,
            onDidReceiveNotificationResponse:
                anyNamed('onDidReceiveNotificationResponse')))
        .thenAnswer((_) async => true);

    await notificationService.initialize();

    verify(mockNotificationsPlugin.initialize(
      any,
      onDidReceiveNotificationResponse:
          anyNamed('onDidReceiveNotificationResponse'),
    )).called(1);
  });

  group('showNotification', () {
    test('should show notification with correct parameters', () async {
      const title = 'Test Title';
      const body = 'Test Body';
      const id = 1;
      const payload = 'test_payload';

      when(mockNotificationsPlugin.show(
        any,
        any,
        any,
        any,
        payload: anyNamed('payload'),
      )).thenAnswer((_) async {});

      await notificationService.showNotification(
        title: title,
        body: body,
        id: id,
        payload: payload,
      );

      verify(mockNotificationsPlugin.show(
        id,
        title,
        body,
        any,
        payload: payload,
      )).called(1);
    });
  });

  group('showBookingConfirmation', () {
    test('should show booking confirmation notification', () async {
      final booking = Booking(
        id: 'booking123',
        userId: 'user123',
        service: 'Bus Trip',
        date: DateTime(2025, 4, 21),
        status: 'confirmed',
        details: {'origin': 'Kampala', 'destination': 'Entebbe'},
      );

      when(mockNotificationsPlugin.show(
        any,
        any,
        any,
        any,
        payload: anyNamed('payload'),
      )).thenAnswer((_) async {});

      await notificationService.showBookingConfirmation(
        booking,
        ticketId: 'ticket123',
      );

      verify(mockNotificationsPlugin.show(
        1,
        'Booking Confirmed',
        'Your booking has been confirmed for Bus Trip on 2025-04-21.',
        any,
        payload: booking.id,
      )).called(1);
    });
  });

  group('showPaymentConfirmation', () {
    test('should show payment confirmation notification', () async {
      final payment = Payment(
        id: 'payment123',
        amount: 50000.0,
        status: 'success',
        timestamp: DateTime.now(),
        method: 'credit_card',
        ticketId: 'ticket123',
      );

      when(mockNotificationsPlugin.show(
        any,
        any,
        any,
        any,
        payload: anyNamed('payload'),
      )).thenAnswer((_) async {});

      await notificationService.showPaymentConfirmation(payment);

      verify(mockNotificationsPlugin.show(
        2,
        'Payment Successful',
        'Payment of \$50000.00 has been processed successfully.',
        any,
        payload: payment.id,
      )).called(1);
    });
  });
}
