import 'package:basiclist/src/pages/detalle.dart';
import 'package:basiclist/src/pages/formulario.dart';
import 'package:basiclist/src/pages/listado.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tareas',
        initialRoute: ListadoPage.nombreruta,
        routes: {
          //Permite navegar en cada una de las paginas
          ListadoPage.nombreruta: (BuildContext context) => ListadoPage(),
          FormularioPage.nombrePagina: (BuildContext context) =>
              FormularioPage(),
          DetallePage.nombrePagina: (BuildContext context) => DetallePage(),
        },
        home: ListadoPage());
  }
}
