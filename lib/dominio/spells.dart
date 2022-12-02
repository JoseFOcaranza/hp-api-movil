import 'package:hp_api/dominio/problemas.dart';

class Spells {
  final String name;
  final String description;

  Spells({required this.name, required this.description});

  factory Spells.constructor({required Map<String, dynamic> json}) {
    try {
      return Spells(name: json['name'], description: json['description']);
    } catch (e) {
      throw IncorrectFormatSpellJson();
    }
  }
}