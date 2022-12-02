import 'package:hp_api/dominio/problemas.dart';

class Performer {
  final String name;
  final String species;
  final String gender;
  final String house;
  final String dateOfBirth;
  final String yearOfBirth;
  final bool wizard;
  final String eyeColour;
  final String hairColour;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final bool alive;
  final String image;

  Performer(
      {required this.name,
      required this.species,
      required this.gender,
      required this.house,
      required this.dateOfBirth,
      required this.yearOfBirth,
      required this.wizard,
      required this.eyeColour,
      required this.hairColour,
      required this.patronus,
      required this.hogwartsStudent,
      required this.hogwartsStaff,
      required this.actor,
      required this.alive,
      required this.image});

  factory Performer.constructor({required Map<String, dynamic> json}) {
    try {
      String image = json['image'];
      String house = json['house'];
      if(house.isEmpty){
        house = "Unknown";
      }
      return Performer(
          name: json['name'],
          species: json['species'],
          gender: json['gender'],
          house: house,
          dateOfBirth: json['dateOfBirth'],
          yearOfBirth: json['yearOfBirth'].toString(),
          wizard: json['wizard'],
          eyeColour: json['eyeColour'],
          hairColour: json['hairColour'],
          patronus: json['patronus'],
          hogwartsStudent: json['hogwartsStudent'],
          hogwartsStaff: json['hogwartsStaff'],
          actor: json['actor'],
          alive: json['alive'],
          image: image.toString().replaceAll('herokuapp', 'onrender'));
    } catch (e) {
      throw IncorrectFormatPerformerJson();
    }
  }
}
