import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_api/dominio/performer.dart';
import 'package:hp_api/verificacion/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VistaOnePerformer extends StatelessWidget {
  const VistaOnePerformer({Key? key, required this.performer})
      : super(key: key);
  final Performer performer;

  @override
  Widget build(BuildContext context) {
    String student = performer.hogwartsStudent.toString();
    String actor = performer.actor;
    String alive = performer.alive.toString();
    String wizard = performer.wizard.toString();
    if (wizard == "true") {
      wizard = "Si";
    } else {
      wizard = "No";
    }
    if (alive == "true") {
      alive = "Si";
    } else {
      alive = "No";
    }
    if (actor.isEmpty) {
      actor = "Espíritu";
    }
    if (student == "true") {
      student = "Si";
    } else {
      student = "No";
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(performer.name),
          backgroundColor: Color.fromARGB(255, 77, 182, 172)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(performer.image),
              height: 300,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: performer.house == ""
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.house,
                              size: 30.0,
                            ),
                            Text(
                              "Casa: ",
                              style: infoStyle(),
                            ),
                            Text(performer.house,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20))
                          ],
                        ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.account_circle,
                        size: 30.0,
                      ),
                      Text(
                        "Estudia en Hogwarts: ",
                        style: infoStyle(),
                      ),
                      Text(
                        student,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                    child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.monitor_heart,
                        size: 30.0,
                      ),
                      Text(
                        "Vive: ",
                        style: infoStyle(),
                      ),
                      Text(
                        alive,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ))),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                    child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.star,
                        size: 30.0,
                      ),
                      Text(
                        "Es Mago: ",
                        style: infoStyle(),
                      ),
                      Text(
                        wizard,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ))),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                    child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.movie_filter,
                        size: 30.0,
                      ),
                      Text(
                        "Interpretado por: ",
                        style: infoStyle(),
                      ),
                      Text(
                        actor,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ))),
            FloatingActionButton.extended(
              onPressed: () {
                var bloc = context.read<BlocVerificacion>();
                bloc.add(MostrarPerformers());
              },
              icon: const Icon(Icons.home_outlined),
              label: const Text('Regresar'),
              backgroundColor: Colors.teal[300],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle infoStyle() {
    return const TextStyle(fontSize: 20);
  }
}
