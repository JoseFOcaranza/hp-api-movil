import 'dart:io';
import 'package:hp_api/dominio/performer.dart';
import 'package:hp_api/dominio/problemas.dart';
import 'package:fpdart/fpdart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class RepositorioPerformers {
  Future<Either<Problema, List<Performer>>> getPerformers(String address);
  Future<Either<Problema, List<Performer>>> getPerformersByFilter(
      String address, filter);
}

class RepositorioPerformersOffline extends RepositorioPerformers {
  @override
  Future<Either<Problema, List<Performer>>> getPerformers(
      String address) async {
    try {
      List<dynamic> file = jsonDecode(File(address).readAsStringSync());

      final resultado = _getPerformersList(file);
      return resultado.match((l) {
        return Left(l);
      }, (r) {
        return Right(r);
      });
    } catch (e) {
      return Left(IncorrectFormatPerformerJson());
    }
  }

  @override
  Future<Either<Problema, List<Performer>>> getPerformersByFilter(
      String address, filter) async {
    String url = '$address/$filter.json';
    List<dynamic> file = [];
    try {
      file = jsonDecode(File(url).readAsStringSync());
    } catch (e) {
      return Left(IncorrectAddress());
    }
    final resultado = _getPerformersList(file);
    return resultado.match((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}

Either<Problema, List<Performer>> _getPerformersList(List<dynamic> lista) {
  try {
    List<Performer> performers = lista
        .map<Performer>((item) => Performer.constructor(json: item))
        .toList();
    return Right(performers);
  } catch (e) {
    return Left(IncorrectFormatPerformerJson());
  }
}

class RepositorioPerformersOnline extends RepositorioPerformers {
  @override
  Future<Either<Problema, List<Performer>>> getPerformers(
      String address) async {
    final response = await http.get(Uri.parse(address));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final resultado = _getPerformersList(json);
      return resultado.match((l) {
        return Left(l);
      }, (r) {
        return Right(r);
      });
    }
    return Left(IncorrectAddress());
  }

  @override
  Future<Either<Problema, List<Performer>>> getPerformersByFilter(
      String address, filter) async {
    String url = '$address/$filter';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final resultado = _getPerformersList(json);
      return resultado.match((l) {
        return Left(l);
      }, (r) {
        return Right(r);
      });
    }
    return Left(IncorrectAddress());
  }
}
