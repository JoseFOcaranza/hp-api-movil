import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hp_api/dominio/performer.dart';
import 'package:hp_api/verificacion/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VistaPerformerByHouse extends StatelessWidget {
  const VistaPerformerByHouse({Key? key, required this.performers})
      : super(key: key);

  final List<Performer> performers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de todos los personajes'),
          backgroundColor: const Color.fromARGB(255, 77, 182, 172),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: performers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          var bloc = context.read<BlocVerificacion>();
                          bloc.add(MostrarOnePerformer(performers[index]));
                        },
                        title: Text(performers[index].name),
                        leading: CachedNetworkImage(
                          imageUrl: performers[index].image,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      );
                    })),
            FloatingActionButton.extended(
              onPressed: () {
                var bloc = context.read<BlocVerificacion>();
                bloc.add(MostrarPerformersByHouse());
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Regresar'),
              backgroundColor: Colors.teal[300],
            ),
          ],
        ));
  }
}
