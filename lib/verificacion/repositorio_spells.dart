import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:hp_api/dominio/problemas.dart';
import 'package:hp_api/dominio/spells.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

abstract class RepositorioSpells {
  Future<Either<Problema, List<Spells>>> getSpells(String address);
}

class RepositorioSpellsOffline extends RepositorioSpells {
  @override
  Future<Either<Problema, List<Spells>>> getSpells(String address) async {
    List<dynamic> file = [];
    try {
      file = jsonDecode(File(address).readAsStringSync());
    } catch (e) {
      return Left(IncorrectFormatSpellJson());
    }
    final resultado = _getSpellsList(file);
    return resultado.match((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}

class RepositorioSpellsOnline extends RepositorioSpells {
  @override
  Future<Either<Problema, List<Spells>>> getSpells(String address) async {
    final response = await http.get(Uri.parse(address));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final resultado = _getSpellsList(json);
      return resultado.match((l) {
        return Left(l);
      }, (r) {
        return Right(r);
      });
    }
    return Left(IncorrectAddress());
  }
}

Either<Problema, List<Spells>> _getSpellsList(List<dynamic> list) {
  try {
    List<Spells> spells =
        list.map<Spells>((item) => Spells.constructor(json: item)).toList();
    return Right(spells);
  } catch (e) {
    return Left(IncorrectFormatSpellJson());
  }
}
