import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:valtre_challege/src/domain/services/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SpeciesServices mockSpeciesService = SpeciesServices();

  group('Species Service', () {
    test('Service success', () async {
      when(mockSpeciesService.serviceSuccess()).thenAnswer(
        (realInvocation) async => [
          'green',
          '"A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON."',
        ],
      );
      await mockSpeciesService.serviceSuccess();
      verify(mockSpeciesService.serviceSuccess());
    });

    test('Service failed', () async {
      when(
        mockSpeciesService.serviceFailed(),
      ).thenAnswer((realInvocation) async => null);
      await mockSpeciesService.serviceFailed();
      verify(mockSpeciesService.serviceFailed());
    });
  });
}

class SpeciesServices extends Mock implements SpeciesService {
  SpeciesServices() {
    throwOnMissingStub(this);
  }

  Future<List<String?>?> serviceSuccess() async => super.noSuchMethod(
    Invocation.method(#getPetsList, <Object>[]),
    returnValue: Future<List<String?>?>.value([
      'green',
      '"A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON."',
    ]),
  );

  Future<List<String?>?> serviceFailed() async => super.noSuchMethod(
    Invocation.method(#getPetsList, <Object>[]),
    returnValue: Future<List<String?>?>.value(null),
  );
}
