import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bus_ticketing_app/auth/models/user_profile.dart';

void main() {
  group('UserProfile', () {
    test('creates a valid UserProfile with required fields', () {
      final profile = UserProfile(
        id: '123',
        email: 'test@example.com',
      );

      expect(profile.id, '123');
      expect(profile.email, 'test@example.com');
      expect(profile.displayName, null);
      expect(profile.phoneNumber, null);
      expect(profile.photoURL, null);
      expect(profile.favoriteRoutes, []);
      expect(profile.preferences, {});
    });

    test('creates a UserProfile with all fields', () {
      final profile = UserProfile(
        id: '123',
        email: 'test@example.com',
        displayName: 'Test User',
        phoneNumber: '+1234567890',
        photoURL: 'https://example.com/photo.jpg',
        favoriteRoutes: ['route1', 'route2'],
        preferences: {'theme': 'dark'},
      );

      expect(profile.id, '123');
      expect(profile.email, 'test@example.com');
      expect(profile.displayName, 'Test User');
      expect(profile.phoneNumber, '+1234567890');
      expect(profile.photoURL, 'https://example.com/photo.jpg');
      expect(profile.favoriteRoutes, ['route1', 'route2']);
      expect(profile.preferences, {'theme': 'dark'});
    });

    test('isValid returns true for valid profile', () {
      final profile = UserProfile(
        id: '123',
        email: 'test@example.com',
      );

      expect(profile.isValid(), true);
    });

    test('isValid returns false for invalid profile', () {
      final profile = UserProfile(
        id: '',
        email: '',
      );

      expect(profile.isValid(), false);
    });

    test('fromJson creates valid UserProfile', () {
      final json = {
        'id': '123',
        'email': 'test@example.com',
        'displayName': 'Test User',
        'phoneNumber': '+1234567890',
        'photoURL': 'https://example.com/photo.jpg',
        'favoriteRoutes': ['route1', 'route2'],
        'preferences': {'theme': 'dark'},
      };

      final profile = UserProfile.fromJson(json);

      expect(profile.id, '123');
      expect(profile.email, 'test@example.com');
      expect(profile.displayName, 'Test User');
      expect(profile.phoneNumber, '+1234567890');
      expect(profile.photoURL, 'https://example.com/photo.jpg');
      expect(profile.favoriteRoutes, ['route1', 'route2']);
      expect(profile.preferences, {'theme': 'dark'});
    });

    test('fromJson throws FormatException for invalid JSON', () {
      final invalidJson = {
        'id': 123, // Should be String
        'email': 'test@example.com',
      };

      expect(
        () => UserProfile.fromJson(invalidJson),
        throwsA(isA<FormatException>()),
      );
    });

    test('toFirestore converts profile to map', () {
      final profile = UserProfile(
        id: '123',
        email: 'test@example.com',
        displayName: 'Test User',
        phoneNumber: '+1234567890',
        photoURL: 'https://example.com/photo.jpg',
        favoriteRoutes: ['route1', 'route2'],
        preferences: {'theme': 'dark'},
      );

      final firestoreData = profile.toFirestore();

      expect(firestoreData['email'], 'test@example.com');
      expect(firestoreData['displayName'], 'Test User');
      expect(firestoreData['phoneNumber'], '+1234567890');
      expect(firestoreData['photoURL'], 'https://example.com/photo.jpg');
      expect(firestoreData['favoriteRoutes'], ['route1', 'route2']);
      expect(firestoreData['preferences'], {'theme': 'dark'});
    });

    test('fromFirestore creates valid UserProfile', () {
      final mockDoc = MockDocumentSnapshot(
        id: '123',
        docData: {
          'email': 'test@example.com',
          'displayName': 'Test User',
          'phoneNumber': '+1234567890',
          'photoURL': 'https://example.com/photo.jpg',
          'favoriteRoutes': ['route1', 'route2'],
          'preferences': {'theme': 'dark'},
        },
      );

      final profile = UserProfile.fromFirestore(mockDoc);

      expect(profile.id, '123');
      expect(profile.email, 'test@example.com');
      expect(profile.displayName, 'Test User');
      expect(profile.phoneNumber, '+1234567890');
      expect(profile.photoURL, 'https://example.com/photo.jpg');
      expect(profile.favoriteRoutes, ['route1', 'route2']);
      expect(profile.preferences, {'theme': 'dark'});
    });

    test('fromFirestore throws FormatException for null data', () {
      final mockDoc = MockDocumentSnapshot(
        id: '123',
        docData: null,
      );

      expect(
        () => UserProfile.fromFirestore(mockDoc),
        throwsA(isA<FormatException>()),
      );
    });
  });
}

// Mock DocumentSnapshot for testing
class MockDocumentSnapshot extends DocumentSnapshot {
  final String id;
  final Map<String, dynamic>? docData;

  MockDocumentSnapshot({required this.id, required this.docData});

  @override
  dynamic get(Object field) => docData?[field.toString()];

  @override
  Map<String, dynamic>? data() => docData;

  @override
  String get documentID => id;

  @override
  bool get exists => docData != null;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
