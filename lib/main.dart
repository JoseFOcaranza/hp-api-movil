import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'verificacion/bloc.dart';
import 'verificacion/vistas/vista_cargando.dart';
import 'verificacion/vistas/vista_principal_page.dart';

import 'verificacion/vistas/vista_performers.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion = BlocVerificacion();
        Future.delayed(const Duration(seconds: 2), () {
          blocVerificacion.add(Creado());
        });

        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            var estado = context.watch<BlocVerificacion>().state;
            if (estado is Creandose) {
              return const Center(child: VistaCreandose());
            }
            if (estado is MostrandoPrincipalPage) {
              return const VistaPrincipalPage();
            }
            if (estado is MostrandoPerformers) {
              return VistaListaPersonajes(performers: estado.performers);
            }
            return const Center(child: Text('huye'));
          },
        ),
      ),
    );
  }
}
