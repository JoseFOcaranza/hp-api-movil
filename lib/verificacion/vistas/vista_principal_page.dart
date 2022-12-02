import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hp_api/verificacion/bloc.dart';

class VistaPrincipalPage extends StatelessWidget {
  const VistaPrincipalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
        backgroundColor: const Color.fromARGB(255, 77, 182, 172),
      ),
      backgroundColor: const Color.fromARGB(80, 150, 153, 225),
      body: Container(
          padding: const EdgeInsets.all(150),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 199,
                    height: 143,
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
                            Icons.api_rounded,
                            size: 20.0,
                          ),
                          Text(
                            "Personajes",
                            style: TextStyle(fontSize: 17.0),
                          )
                        ],
                      )),
                    )),
                  ),
                  SizedBox(
                    width: 199,
                    height: 143,
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
                            Icons.api_rounded,
                            size: 20.0,
                          ),
                          Text(
                            "Houses",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17.0),
                          )
                        ],
                      )),
                    )),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
