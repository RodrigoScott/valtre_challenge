import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:valtre_challege/src/domain/models/pokemon/pokemon_detail_model.dart';
import 'package:valtre_challege/src/domain/services/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SearchServices mockSearchService = SearchServices();

  group('Search Service', () {
    test('Service success', () async {
      when(
        mockSearchService.serviceSuccess(),
      ).thenAnswer((realInvocation) async => PokemonDetailModel());
      await mockSearchService.serviceSuccess();
      verify(mockSearchService.serviceSuccess());
    });

    test('Service failed', () async {
      when(
        mockSearchService.serviceFailed(),
      ).thenAnswer((realInvocation) async => null);
      await mockSearchService.serviceFailed();
      verify(mockSearchService.serviceFailed());
    });
  });
}

class SearchServices extends Mock implements SearchService {
  SearchServices() {
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
