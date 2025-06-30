import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_ticketing_app/auth/models/user_profile.dart';

class UserProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserProfile?> getUserProfile(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      return UserProfile.fromFirestore(doc);
    }
    return null;
  }

  Future<void> createUserProfile(UserProfile profile) async {
    await _firestore.collection('users').doc(profile.id).set(profile.toJson());
  }

  Future<void> updateUserProfile(
      String userId, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(userId).update(data);
  }

  Future<void> addFavoriteRoute(String userId, String routeId) async {
    await _firestore.collection('users').doc(userId).update({
      'favoriteRoutes': FieldValue.arrayUnion([routeId]),
    });
  }

  Future<void> removeFavoriteRoute(String userId, String routeId) async {
    await _firestore.collection('users').doc(userId).update({
      'favoriteRoutes': FieldValue.arrayRemove([routeId]),
    });
  }

  Future<void> updatePreferences(
      String userId, Map<String, dynamic> preferences) async {
    await _firestore.collection('users').doc(userId).update({
      'preferences': preferences,
    });
  }

  Stream<UserProfile> userProfileStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((doc) => UserProfile.fromFirestore(doc));
  }
}
