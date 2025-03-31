import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:valtre_challege/src/domain/models/models.dart';
import 'package:valtre_challege/src/domain/services/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HomePageServices mockHomePageService = HomePageServices();

  group('Home Page Service', () {
    test('Service success', () async {
      when(
        mockHomePageService.serviceSuccess(),
      ).thenAnswer((realInvocation) async => PokemonListModel());
      await mockHomePageService.serviceSuccess();
      verify(mockHomePageService.serviceSuccess());
    });

    test('Service failed', () async {
      when(
        mockHomePageService.serviceFailed(),
      ).thenAnswer((realInvocation) async => null);
      await mockHomePageService.serviceFailed();
      verify(mockHomePageService.serviceFailed());
    });
  });
}

class HomePageServices extends Mock implements HomePageService {
  HomePageServices() {
    throwOnMissingStub(this);
  }

  Future<PokemonListModel?> serviceSuccess() async => super.noSuchMethod(
    Invocation.method(#getPetsList, <Object>[]),
    returnValue: Future<PokemonListModel?>.value(PokemonListModel()),
  );

  Future<PokemonListModel?> serviceFailed() async => super.noSuchMethod(
    Invocation.method(#getPetsList, <Object>[]),
    returnValue: Future<PokemonListModel?>.value(null),
  );
}
