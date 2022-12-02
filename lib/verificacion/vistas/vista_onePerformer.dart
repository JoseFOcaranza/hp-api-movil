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
    return Scaffold(
      appBar: AppBar(
        title: Text(performer.name),
        backgroundColor: Color.fromARGB(255, 77, 182, 172)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(performer.image),
              height: 300,
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: performer.house == ""
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Casa: ",
                              style: infoStyle(),
                            ),
                            Text(performer.house,
                                style: const TextStyle(fontSize: 20))
                          ],
                        ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Estudiante de Hogwarts: ",
                        style: infoStyle(),
                      ),
                      Text(
                        performer.hogwartsStudent.toString(),
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                child: Card(
                    child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "Actor que lo interpreta: ${performer.actor}",
                          style: infoStyle(),
                        ),
                      ),
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
