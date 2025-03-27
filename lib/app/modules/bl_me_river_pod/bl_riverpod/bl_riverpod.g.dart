// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bl_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blRiverpodHash() => r'2ba3eaad0e1f64d1471ce8e21b24cdb12d0ec1a3';

/// See also [blRiverpod].
@ProviderFor(blRiverpod)
final blRiverpodProvider = Provider<BlRiverpod>.internal(
  blRiverpod,
  name: r'blRiverpodProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$blRiverpodHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BlRiverpodRef = ProviderRef<BlRiverpod>;
String _$userInfoServiceHash() => r'40953e2d40de943d926ea5a3ae231a3bdfdd7437';

/// See also [UserInfoService].
@ProviderFor(UserInfoService)
final userInfoServiceProvider =
    AsyncNotifierProvider<UserInfoService, AppInfoDetailEntity>.internal(
  UserInfoService.new,
  name: r'userInfoServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userInfoServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserInfoService = AsyncNotifier<AppInfoDetailEntity>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
