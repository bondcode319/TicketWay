import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bus_ticketing_app/auth/models/user_profile.dart';
import 'package:bus_ticketing_app/auth/services/user_profile_service.dart';
import 'package:bus_ticketing_app/auth/providers/auth_provider.dart';

final userProfileServiceProvider = Provider<UserProfileService>((ref) {
  return UserProfileService();
});

final userProfileProvider = StreamProvider<UserProfile?>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return Stream.value(null);

  final userProfileService = ref.watch(userProfileServiceProvider);
  return userProfileService.userProfileStream(user.uid);
});

final favoriteRoutesProvider = Provider<List<String>>((ref) {
  return ref.watch(userProfileProvider).when(
        data: (profile) => profile?.favoriteRoutes ?? [],
        loading: () => [],
        error: (_, __) => [],
      );
});

final userPreferencesProvider = Provider<Map<String, dynamic>>((ref) {
  return ref.watch(userProfileProvider).when(
        data: (profile) => profile?.preferences ?? {},
        loading: () => {},
        error: (_, __) => {},
      );
});
