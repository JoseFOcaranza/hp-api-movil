import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hp_api/verificacion/bloc.dart';
import 'package:hp_api/verificacion/vistas/vista_performers.dart';

class VistaPrincipalPage extends StatelessWidget {
  const VistaPrincipalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
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
                        bloc.add(MostrarPerformers());
                      },
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.account_circle,
                            size: 30.0,
                          ),
                          Text(
                            "Personajes",
                            style: TextStyle(fontSize: 20),
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
                        bloc.add(MostrarSpells());
                      },
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.star,
                            size: 30.0,
                          ),
                          Text(
                            "Hechizos",
                            style: TextStyle(fontSize: 20),
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
                        bloc.add(MostrarPerformersByHouse());
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
                            "Casas",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
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
                        bloc.add(MostrarPerformersHogwartsStudents());
                      },
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.school,
                            size: 30.0,
                          ),
                          Text(
                            "Students",
                            style: TextStyle(fontSize: 20),
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
                        bloc.add(MostrarPerformersHogwartsStaff());
                      },
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.gavel_sharp,
                            size: 30.0,
                          ),
                          Text(
                            "Staff",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                    )),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
