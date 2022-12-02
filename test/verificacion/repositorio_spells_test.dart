import 'package:flutter_test/flutter_test.dart';
import 'package:hp_api/dominio/problemas.dart';
import 'package:hp_api/dominio/spells.dart';
import 'package:hp_api/verificacion/repositorio_spells.dart';

void main() {
  group('test Offline', () {
    test('Deben ser 7 spells', () async {
      RepositorioSpellsOffline repositorioOffline = RepositorioSpellsOffline();
      var resultado = await repositorioOffline
          .getSpells('./test/verificacion/spell_list/spell-list-1.json');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r.length, 7);
        expect(r, isA<List<Spells>>());
      });
    });
    test('Debe ser error de Json incorrecto', () async {
      RepositorioSpellsOffline repositorioOffline = RepositorioSpellsOffline();
      var resultado = await repositorioOffline
          .getSpells('./test/verificacion/spell_list/spell-list-2.json');
      resultado.match((l) {
        expect(l, isA<IncorrectFormatSpellJson>());
      }, (r) {
        assert(true);
      });
    });
  });
  group('test Online', () {
    test('Deben ser 77 spells', () async {
      RepositorioSpellsOnline repositorioOnline = RepositorioSpellsOnline();
      var resultado = await repositorioOnline
          .getSpells('https://hp-api.onrender.com/api/spells');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r.length, 77);
      });
    });
    test('Debe ser una lista de spells', () async {
      RepositorioSpellsOnline repositorioOnline = RepositorioSpellsOnline();
      var resultado = await repositorioOnline
          .getSpells('https://hp-api.onrender.com/api/spells');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r, isA<List<Spells>>());
      });
    });
    test('Debe ser error de ruta incorrecta', () async {
      RepositorioSpellsOnline repositorioOnline = RepositorioSpellsOnline();
      var resultado = await repositorioOnline
          .getSpells('https://hp-api.onrender.com/api/split');
      resultado.match((l) {
        expect(l, isA<IncorrectAddress>());
      }, (r) {
        assert(true);
      });
    });
  });
}
