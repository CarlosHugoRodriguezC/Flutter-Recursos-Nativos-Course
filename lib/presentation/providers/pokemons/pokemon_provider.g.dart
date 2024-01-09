// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonsRepositoryHash() =>
    r'f45284619516cd26e10ea707c55dc1173f1f1815';

/// See also [pokemonsRepository].
@ProviderFor(pokemonsRepository)
final pokemonsRepositoryProvider =
    AutoDisposeProvider<PokemonsRepository>.internal(
  pokemonsRepository,
  name: r'pokemonsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PokemonsRepositoryRef = AutoDisposeProviderRef<PokemonsRepository>;
String _$getPokemonHash() => r'c355dd3740a37ee849ac8601279955392ea25e79';

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

/// See also [getPokemon].
@ProviderFor(getPokemon)
const getPokemonProvider = GetPokemonFamily();

/// See also [getPokemon].
class GetPokemonFamily extends Family<AsyncValue<Pokemon>> {
  /// See also [getPokemon].
  const GetPokemonFamily();

  /// See also [getPokemon].
  GetPokemonProvider call({
    required String pokemonId,
  }) {
    return GetPokemonProvider(
      pokemonId: pokemonId,
    );
  }

  @override
  GetPokemonProvider getProviderOverride(
    covariant GetPokemonProvider provider,
  ) {
    return call(
      pokemonId: provider.pokemonId,
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
  String? get name => r'getPokemonProvider';
}

/// See also [getPokemon].
class GetPokemonProvider extends AutoDisposeFutureProvider<Pokemon> {
  /// See also [getPokemon].
  GetPokemonProvider({
    required String pokemonId,
  }) : this._internal(
          (ref) => getPokemon(
            ref as GetPokemonRef,
            pokemonId: pokemonId,
          ),
          from: getPokemonProvider,
          name: r'getPokemonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPokemonHash,
          dependencies: GetPokemonFamily._dependencies,
          allTransitiveDependencies:
              GetPokemonFamily._allTransitiveDependencies,
          pokemonId: pokemonId,
        );

  GetPokemonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pokemonId,
  }) : super.internal();

  final String pokemonId;

  @override
  Override overrideWith(
    FutureOr<Pokemon> Function(GetPokemonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPokemonProvider._internal(
        (ref) => create(ref as GetPokemonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pokemonId: pokemonId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Pokemon> createElement() {
    return _GetPokemonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPokemonProvider && other.pokemonId == pokemonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pokemonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPokemonRef on AutoDisposeFutureProviderRef<Pokemon> {
  /// The parameter `pokemonId` of this provider.
  String get pokemonId;
}

class _GetPokemonProviderElement
    extends AutoDisposeFutureProviderElement<Pokemon> with GetPokemonRef {
  _GetPokemonProviderElement(super.provider);

  @override
  String get pokemonId => (origin as GetPokemonProvider).pokemonId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
