import 'package:flutter/material.dart';
import 'package:hp_api/dominio/performer.dart';
import 'package:hp_api/verificacion/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VistaPerformers extends StatelessWidget {
  const VistaPerformers({super.key, required this.performers});
  final List<Performer> performers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Personajes'),
          backgroundColor: Color.fromARGB(255, 77, 182, 172),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: performers.length,
                    itemBuilder: (BuildContext context, int index) {
                      String birthDate = performers[index].dateOfBirth;
                      if (birthDate.isEmpty) {
                        birthDate = "Unknown";
                      }
                      return ListTile(
                        onTap: () {
                          var bloc = context.read<BlocVerificacion>();
                          bloc.add(MostrarOnePerformer(performers[index]));
                        },
                        title: Text(
                          performers[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(birthDate),
                        leading: CachedNetworkImage(
                          imageUrl: performers[index].image,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        trailing: Text(performers[index].species),
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
