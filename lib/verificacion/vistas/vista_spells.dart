import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hp_api/dominio/spells.dart';
import 'package:hp_api/verificacion/bloc.dart';

class VistaSpells extends StatelessWidget {
  const VistaSpells({Key? key, required this.spells}) : super(key: key);
  final List<Spells> spells;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hechizos'),
          backgroundColor: Color.fromARGB(255, 77, 182, 172),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: spells.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(spells[index].name),
                        subtitle: Text(spells[index].description),
                        leading: const Icon(Icons.star),
                      );
                    })),
            FloatingActionButton.extended(
              onPressed: () {
                var bloc = context.read<BlocVerificacion>();
                bloc.add(Creado());
              },
              icon: const Icon(Icons.home_outlined),
              label: const Text('Regresar'),
              backgroundColor: Colors.teal[300],
            ),
          ],
        ));
  }
}
