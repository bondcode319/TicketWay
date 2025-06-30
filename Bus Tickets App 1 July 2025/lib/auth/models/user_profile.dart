import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// A class representing a user's profile information.
/// This class is immutable and uses Freezed for code generation.
@freezed
class UserProfile with _$UserProfile {
  const UserProfile._(); // Private constructor for custom methods

  const factory UserProfile({
    required String id,
    required String email,
    String? displayName,
    String? phoneNumber,
    String? photoURL,
    @Default([]) List<String> favoriteRoutes,
    @Default({}) Map<String, dynamic> preferences,
  }) = _UserProfile;

  /// Creates a UserProfile from a JSON map.
  /// Throws [FormatException] if the JSON is invalid.
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    try {
      return _$UserProfileFromJson(json);
    } catch (e) {
      throw FormatException('Invalid JSON format for UserProfile: $e');
    }
  }

  /// Creates a UserProfile from a Firestore document.
  /// Throws [FormatException] if the document data is invalid.
  factory UserProfile.fromFirestore(DocumentSnapshot doc) {
    try {
      final data = doc.data() as Map<String, dynamic>?;
      if (data == null) {
        throw FormatException('Document data is null');
      }

      return UserProfile.fromJson({
        'id': doc.id,
        'email': data['email'] ?? '',
        'displayName': data['displayName'],
        'phoneNumber': data['phoneNumber'],
        'photoURL': data['photoURL'],
        'favoriteRoutes': List<String>.from(data['favoriteRoutes'] ?? []),
        'preferences': data['preferences'] ?? {},
      });
    } catch (e) {
      throw FormatException(
          'Error converting Firestore document to UserProfile: $e');
    }
  }

  /// Validates the user profile data.
  /// Returns true if the profile is valid, false otherwise.
  bool isValid() {
    return id.isNotEmpty && email.isNotEmpty;
  }

  /// Converts the user profile to a map suitable for Firestore.
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
      'favoriteRoutes': favoriteRoutes,
      'preferences': preferences,
    };
  }
}
