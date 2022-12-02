import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_api/verificacion/bloc.dart';

class VistaHouses extends StatelessWidget {
  const VistaHouses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casas'),
        backgroundColor: const Color.fromARGB(255, 77, 182, 172),
      ),
      backgroundColor: const Color.fromARGB(80, 208, 206, 206),
      body: Container(
        padding: const EdgeInsets.all(150),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 180,
                  child: Card(
                      child: InkWell(
                    onTap: () {
                      var bloc = context.read<BlocVerificacion>();
                      bloc.add(MostrarPerformersByAHouse("Gryffindor"));
                    },
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.house,
                          size: 30.0,
                        ),
                        Text(
                          "Gryffindor",
                          style: TextStyle(fontSize: 22.0),
                        )
                      ],
                    )),
                  )),
                ),
                SizedBox(
                  width: 250,
                  height: 180,
                  child: Card(
                      child: InkWell(
                    onTap: () {
                      var bloc = context.read<BlocVerificacion>();
                      bloc.add(MostrarPerformersByAHouse("Slytherin"));
                    },
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.house,
                          size: 30.0,
                        ),
                        Text(
                          "Slytherin",
                          style: TextStyle(fontSize: 22.0),
                        )
                      ],
                    )),
                  )),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 180,
                  child: Card(
                      child: InkWell(
                    onTap: () {
                      var bloc = context.read<BlocVerificacion>();
                      bloc.add(MostrarPerformersByAHouse("Hufflepuff"));
                    },
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.house,
                          size: 30.0,
                        ),
                        Text(
                          "Hufflepuff",
                          style: TextStyle(fontSize: 22.0),
                        )
                      ],
                    )),
                  )),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 180,
                  child: Card(
                      child: InkWell(
                    onTap: () {
                      var bloc = context.read<BlocVerificacion>();
                      bloc.add(MostrarPerformersByAHouse("Ravenclaw"));
                    },
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.house,
                          size: 30.0,
                        ),
                        Text(
                          "Ravenclaw",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22.0),
                        )
                      ],
                    )),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var bloc = context.read<BlocVerificacion>();
          bloc.add(Creado());
        },
        icon: const Icon(Icons.home_outlined),
        label: const Text('Regresar'),
        backgroundColor: Colors.teal[300],
      ),
    );
  }
}
