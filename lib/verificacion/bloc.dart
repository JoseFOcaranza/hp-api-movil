import 'package:bloc/bloc.dart';
import 'dart:io';

class Estado {}

class MostrandoPaginaPrincipal extends Estado {}

class Creandose extends Estado {}

class Evento {}

class Creado extends Evento {}

class MostrarPerformer extends Evento {
  final String address;

  MostrarPerformer(this.address);
}

class MostrarSpell extends Evento {
  final String address;

  MostrarSpell(this.address);
}

class MostrarPerformerHouse extends Evento {
  final String address;
  final String house;

  MostrarPerformerHouse(this.address, this.house);
}

class MostrarPerformerHogwartsStudents extends Evento {
  final String address;
  final String student;

  MostrarPerformerHogwartsStudents(this.address, this.student);
}

class MostrarPersonajesStaff extends Evento {
  final String address;
  final String staff;

  MostrarPersonajesStaff(this.address, this.staff);
}

class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(MostrandoPaginaPrincipal());
    });
  }
}
