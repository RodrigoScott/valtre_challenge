import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:valtre_challege/src/domain/models/pokemon/pokemon_detail_model.dart';
import 'package:valtre_challege/src/domain/services/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MockDetailPokemonService mockDetailPokemonService =
      MockDetailPokemonService();

  group('Detail Pokemon Service', () {
    test('Service success', () async {
      when(
        mockDetailPokemonService.serviceSuccess(),
      ).thenAnswer((realInvocation) async => PokemonDetailModel());
      await mockDetailPokemonService.serviceSuccess();
      verify(mockDetailPokemonService.serviceSuccess());
    });

    test('Service failed', () async {
      when(
        mockDetailPokemonService.serviceFailed(),
      ).thenAnswer((realInvocation) async => null);
      await mockDetailPokemonService.serviceFailed();
      verify(mockDetailPokemonService.serviceFailed());
    });
  });
}

class MockDetailPokemonService extends Mock implements PokemonDetailService {
  MockDetailPokemonService() {
    throwOnMissingStub(this);
  }

  Future<PokemonDetailModel?> serviceSuccess() async => super.noSuchMethod(
    Invocation.method(#getPetsList, <Object>[]),
    returnValue: Future<PokemonDetailModel?>.value(PokemonDetailModel()),
  );

  Future<PokemonDetailModel?> serviceFailed() async => super.noSuchMethod(
    Invocation.method(#getPetsList, <Object>[]),
    returnValue: Future<PokemonDetailModel?>.value(null),
  );
}
