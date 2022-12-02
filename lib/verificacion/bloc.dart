import 'package:bloc/bloc.dart';
import 'dart:io';

import 'package:hp_api/dominio/performer.dart';
import 'package:hp_api/dominio/spells.dart';
import 'package:hp_api/verificacion/repositorio_performers.dart';
import 'package:hp_api/verificacion/repositorio_spells.dart';

class Estado {}

class Creandose extends Estado {}

class MostrandoPerformersByHouse extends Estado {}

class MostrandoPerformersByAHouse extends Estado {
  final List<Performer> performers;

  MostrandoPerformersByAHouse(this.performers);
}

class MostrandoPerformers extends Estado {
  final List<Performer> performers;

  MostrandoPerformers(this.performers);
}

class MostrandoOnePerformer extends Estado {
  final Performer performer;

  MostrandoOnePerformer(this.performer);
}

class MostrandoPrincipalPage extends Estado {}

class MostrandoOfflineScreen extends Estado {}

class MostrandoSpells extends Estado {
  final List<Spells> spells;

  MostrandoSpells(this.spells);
}

class MostrandoPerformersHogwartsStaff extends Estado {
  final List<Performer> performers;

  MostrandoPerformersHogwartsStaff(this.performers);
}

class MostrandoPerformersHogwartsStudents extends Estado {
  final List<Performer> performers;

  MostrandoPerformersHogwartsStudents(this.performers);
}

class Evento {}

class Creado extends Evento {}

class MostrarPerformers extends Evento {}

class MostrarPerformersByHouse extends Evento {}

class MostrarOnePerformer extends Evento {
  final Performer performer;

  MostrarOnePerformer(this.performer);
}

class MostrarPerformersByAHouse extends Evento {
  final String house;

  MostrarPerformersByAHouse(this.house);
}

class MostrarSpells extends Evento {}

class MostrarPerformerHouse extends Evento {
  final String address;
  final String house;

  MostrarPerformerHouse(this.address, this.house);
}

class MostrarPerformersHogwartsStaff extends Evento {}

class MostrarPerformersHogwartsStudents extends Evento {}

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
        emit(MostrandoOfflineScreen());
      }, (r) {
        emit(MostrandoPerformers(r));
      });
    });

    on<MostrarOnePerformer>((event, emit) async {
      emit(MostrandoOnePerformer(event.performer));
    });

    on<MostrarPerformersByHouse>((event, emit) async {
      emit(MostrandoPerformersByHouse());
    });

    on<MostrarPerformersByAHouse>((event, emit) async {
      RepositorioPerformersOnline repoOnline = RepositorioPerformersOnline();
      var resultado = await repoOnline.getPerformersByFilter(
          'https://hp-api.onrender.com/api/characters/house', event.house);
      resultado.match((l) {
        emit(MostrandoOfflineScreen());
      }, (r) {
        emit(MostrandoPerformersByAHouse(r));
      });
    });

    on<MostrarSpells>((event, emit) async {
      RepositorioSpellsOnline repositorioOnline = RepositorioSpellsOnline();
      var resultado = await repositorioOnline
          .getSpells('https://hp-api.onrender.com/api/spells');
      resultado.match((l) {
        emit(MostrandoOfflineScreen());
      }, (r) {
        emit(MostrandoSpells(r));
      });
    });

    on<MostrarPerformersHogwartsStaff>((event, emit) async {
      RepositorioPerformersOnline repositorioOnline =
          RepositorioPerformersOnline();
      var resultado = await repositorioOnline.getPerformersByFilter(
          'https://hp-api.onrender.com/api/characters', 'staff');
      resultado.match((l) {
        emit(MostrandoOfflineScreen());
      }, (r) {
        emit(MostrandoPerformersHogwartsStaff(r));
      });
    });

    on<MostrarPerformersHogwartsStudents>((event, emit) async {
      RepositorioPerformersOnline repositorioOnline =
          RepositorioPerformersOnline();
      var resultado = await repositorioOnline.getPerformersByFilter(
          'https://hp-api.onrender.com/api/characters', 'students');
      resultado.match((l) {
        emit(MostrandoOfflineScreen());
      }, (r) {
        emit(MostrandoPerformersHogwartsStudents(r));
      });
    });
  }
}
