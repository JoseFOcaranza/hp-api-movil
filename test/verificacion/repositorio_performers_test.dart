import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api/dominio/performer.dart';
import 'package:hp_api/dominio/problemas.dart';
import 'package:hp_api/verificacion/repositorio_performers.dart';

void main() {
  group('Prueba Offline', () {
    test('Debe mostrar 3 personajes', () async {
      RepositorioPerformersOffline repositorioOffline =
          RepositorioPerformersOffline();
      var resultado = await repositorioOffline
          .getPerformers('./test/verificacion/performer_list/list-1.json');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r.length, 3);
        expect(r, isA<List<Performer>>());
      });
    });

    test('Debe ser error de Json incorrecto', () async {
      RepositorioPerformersOffline repositorioOffline =
          RepositorioPerformersOffline();
      var resultado = await repositorioOffline
          .getPerformers('./test/verificacion/performer_list/list-2.json');
      resultado.match((l) {
        expect(l, isA<IncorrectFormatPerformerJson>());
      }, (r) {
        assert(true);
      });
    });
  });
  group('Personajes by house Offline', () {
    test('Deben ser puros estudiantes de Ravenclaw', () async {
      RepositorioPerformersOffline repositorioOffline =
          RepositorioPerformersOffline();
      var resultado = await repositorioOffline.getPerformersByFilter(
          './test/verificacion/performer_list', 'Ravenclaw-house');
      resultado.match((l) {
        assert(false);
      }, (r) {
        for (var i = 0; i < r.length; i++) {
          expect(r[i].house, 'Ravenclaw');
        }
      });
    });

    test('Debe ser error de ruta incorrecta', () async {
      RepositorioPerformersOffline repositorioOffline =
          RepositorioPerformersOffline();
      var resultado = await repositorioOffline.getPerformersByFilter(
          './test/verificacion/performer_list', 'griffonr');
      resultado.match((l) {
        expect(l, isA<IncorrectAddress>());
      }, (r) {
        assert(true);
      });
    });
  });
  group('Personajes que son students Offline', () {
    test('Deben ser puros students', () async {
      RepositorioPerformersOffline repositorioOffline =
          RepositorioPerformersOffline();
      var resultado = await repositorioOffline.getPerformersByFilter(
          './test/verificacion/performer_list', 'students');
      resultado.match((l) {
        assert(false);
      }, (r) {
        for (var i = 0; i < r.length; i++) {
          expect(r[i].hogwartsStudent, true);
        }
      });
    });
  });

  group('Prueba Online', () {
    test('Deben ser 403 personajes', () async {
      RepositorioPerformersOnline repositorioOnline =
          RepositorioPerformersOnline();
      var resultado = await repositorioOnline
          .getPerformers('https://hp-api.onrender.com/api/characters');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r.length, 403);
      });
    });

    test('Debe ser una lista de personajes', () async {
      RepositorioPerformersOnline repositorioOnline =
          RepositorioPerformersOnline();
      var resultado = await repositorioOnline
          .getPerformers('https://hp-api.onrender.com/api/characters');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r, isA<List<Performer>>());
      });
    });

    test('Debe ser error de ruta incorrecta', () async {
      RepositorioPerformersOnline repositorioOnline =
          RepositorioPerformersOnline();
      var resultado = await repositorioOnline
          .getPerformers('https://hp-api.onrender.com/api/wrongRuta');
      resultado.match((l) {
        expect(l, isA<IncorrectAddress>());
      }, (r) {
        assert(true);
      });
    });
  });
  group('Personajes by house Online', () {
    test('Deben ser estudiantes de Gryffindor', () async {
      RepositorioPerformersOnline repositorioOnline =
          RepositorioPerformersOnline();
      var resultado = await repositorioOnline.getPerformersByFilter(
          'https://hp-api.onrender.com/api/characters/house', 'Gryffindor');
      resultado.match((l) {
        assert(false);
      }, (r) {
        for (var i = 0; i < r.length; i++) {
          expect(r[i].house, 'Gryffindor');
        }
      });
    });

    test('Deben ser estudiantes de Ravenclaw', () async {
      RepositorioPerformersOnline repositorioOnline =
          RepositorioPerformersOnline();
      var resultado = await repositorioOnline.getPerformersByFilter(
          'https://hp-api.onrender.com/api/characters/house', 'Ravenclaw');
      resultado.match((l) {
        assert(false);
      }, (r) {
        for (var i = 0; i < r.length; i++) {
          expect(r[i].house, 'Ravenclaw');
        }
      });
    });

    test('Debe ser error de ruta incorrecta', () async {
      RepositorioPerformersOnline repositorioOnline =
          RepositorioPerformersOnline();
      var resultado = await repositorioOnline.getPerformersByFilter(
          'https://hp-api.onrender.com/api/characters/house', 'Slyteron');
      resultado.match((l) {
        expect(l, isA<IncorrectAddress>());
      }, (r) {
        assert(true);
      });
    });
  });
  group('Personajes que son students Online', () {
    test('Deben ser puros students', () async {
      RepositorioPerformersOnline repositorioOnline =
          RepositorioPerformersOnline();
      var resultado = await repositorioOnline.getPerformersByFilter(
          'https://hp-api.onrender.com/api/characters', 'students');
      resultado.match((l) {
        assert(false);
      }, (r) {
        for (var i = 0; i < r.length; i++) {
          expect(r[i].hogwartsStudent, true);
        }
      });
    });
  });
}
