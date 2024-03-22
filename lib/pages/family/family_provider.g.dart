// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$familyHelloHash() => r'2ce13d97e2f177d6aa8ec5019fa3bf034d08de7e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [familyHello].
@ProviderFor(familyHello)
const familyHelloProvider = FamilyHelloFamily();

/// See also [familyHello].
class FamilyHelloFamily extends Family<String> {
  /// See also [familyHello].
  const FamilyHelloFamily();

  /// See also [familyHello].
  FamilyHelloProvider call(
    String name,
  ) {
    return FamilyHelloProvider(
      name,
    );
  }

  @override
  FamilyHelloProvider getProviderOverride(
    covariant FamilyHelloProvider provider,
  ) {
    return call(
      provider.name,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'familyHelloProvider';
}

/// See also [familyHello].
class FamilyHelloProvider extends Provider<String> {
  /// See also [familyHello].
  FamilyHelloProvider(
    String name,
  ) : this._internal(
          (ref) => familyHello(
            ref as FamilyHelloRef,
            name,
          ),
          from: familyHelloProvider,
          name: r'familyHelloProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$familyHelloHash,
          dependencies: FamilyHelloFamily._dependencies,
          allTransitiveDependencies:
              FamilyHelloFamily._allTransitiveDependencies,
          name: name,
        );

  FamilyHelloProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.name,
  }) : super.internal();

  final String name;

  @override
  Override overrideWith(
    String Function(FamilyHelloRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FamilyHelloProvider._internal(
        (ref) => create(ref as FamilyHelloRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        name: name,
      ),
    );
  }

  @override
  ProviderElement<String> createElement() {
    return _FamilyHelloProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FamilyHelloProvider && other.name == name;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FamilyHelloRef on ProviderRef<String> {
  /// The parameter `name` of this provider.
  String get name;
}

class _FamilyHelloProviderElement extends ProviderElement<String>
    with FamilyHelloRef {
  _FamilyHelloProviderElement(super.provider);

  @override
  String get name => (origin as FamilyHelloProvider).name;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
