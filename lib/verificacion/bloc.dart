import 'package:bloc/bloc.dart';
import 'dart:io';

import 'package:hp_api/dominio/performer.dart';
import 'package:hp_api/verificacion/repositorio_performers.dart';

class Estado {}

class Creandose extends Estado {}

class MostrandoPerformers extends Estado {
  final List<Performer> performers;

  MostrandoPerformers(this.performers);
}

class MostrandoOnePerformer extends Estado {
  final Performer performer;

  MostrandoOnePerformer(this.performer);
}

class MostrandoPrincipalPage extends Estado {}

class MostrandoPantallaSinInternet extends Estado {}

class Evento {}

class Creado extends Evento {}

class MostrarPerformers extends Evento {}

class MostrarOnePerformer extends Evento {
  final Performer performer;

  MostrarOnePerformer(this.performer);
}

class MostrarPersonajesDeUnaCasa extends Evento {
  final String casa;

  MostrarPersonajesDeUnaCasa(this.casa);
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
      emit(MostrandoPrincipalPage());
    });

    on<MostrarPerformers>((event, emit) async {
      RepositorioPerformersOnline repositorioOnline =
          RepositorioPerformersOnline();
      var resultado = await repositorioOnline
          .getPerformers('https://hp-api.onrender.com/api/characters');
      resultado.match((l) {
        emit(MostrandoPantallaSinInternet());
      }, (r) {
        emit(MostrandoPerformers(r));
      });
    });

    on<MostrarOnePerformer>((event, emit) async {
      emit(MostrandoOnePerformer(event.performer));
    });
  }
}
