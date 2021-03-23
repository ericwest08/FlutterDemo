import 'package:basiclist/src/pages/detalle.dart';
import 'package:basiclist/src/pages/formulario.dart';
import 'package:basiclist/src/providers/tareas_provider.dart';
import 'package:flutter/material.dart';

class ListadoPage extends StatefulWidget {
  const ListadoPage({Key key}) : super(key: key);

  static final nombreruta = 'listado';

  static final List<Map<String, dynamic>> tareas = [
    {
      'nombre': 'Tarea uno',
      'descripcion': 'Descripción de la tarea uno',
      'estado': false
    },
    {
      'nombre': 'Tarea dos',
      'descripcion': 'Descripción de la tarea dos',
      'estado': false
    },
    {
      'nombre': 'Tarea tres',
      'descripcion': 'Descripción de la tarea tres',
      'estado': true
    }
  ];

  @override
  _ListadoPageState createState() => _ListadoPageState();
}

class _ListadoPageState extends State<ListadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado'),
      ),
      body: (TareasProvider().tareas.isNotEmpty)
          ? ListView(children: _crearItem(context))
          : Center(
              child: Text('No hay tareas agregadas'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, FormularioPage.nombrePagina),
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> _crearItem(BuildContext context) {
    List<Widget> temporal = [];

    for (Map<String, dynamic> tarea in TareasProvider().tareas) {
      Widget item = ListTile(
        onTap: () {
          return Navigator.pushNamed(context, DetallePage.nombrePagina,
              arguments: tarea); //arguments te recibe cualquier parametro
        }, //Si esta terminada o no la tarea, es estilo onPressed
        title: Text('${tarea['nombre']}'),
        trailing: (tarea['estado'])
            ? Icon(Icons.star)
            : Icon(Icons
                .star_border), //esto es un if mucho mas rapido (si tarea estado es verdader se ejecuta)
      );
      temporal.add(item);
    }

    return temporal;
  }
}
