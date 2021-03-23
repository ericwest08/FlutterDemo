import 'package:basiclist/src/pages/formulario.dart';
import 'package:basiclist/src/providers/tareas_provider.dart';
import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {
  //Ver detalle de una variable por lo tanto es stateless no hay que interactuar
  const DetallePage({Key key}) : super(key: key);

  static final nombrePagina = 'detalle';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> tarea = ModalRoute.of(context)
        .settings
        .arguments; //Clase que gestiona la info de la ruta que manejas en el navigator. Devuelve todo lo que hayamos pasado en argumentos y lo pone en tarea
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text('Tarea:', style: TextStyle(fontSize: 20))),
          Text('${tarea['nombre']}'),
          Text(' '),
          Text('Descripción:', style: TextStyle(fontSize: 20)),
          Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text('${tarea['descripcion']}')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  TareasProvider().terminarTarea(tarea);
                  Navigator.pop(context);
                },
                color: Colors.green,
                textColor: Colors.white,
                child: Text('Finalizar'),
              ),
              RaisedButton(
                onPressed: () => Navigator.pushNamed(
                    context, FormularioPage.nombrePagina,
                    arguments: tarea),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Editar'),
              ),
              RaisedButton(
                onPressed: () {
                  TareasProvider().eliminarTarea(tarea);
                  Navigator.pop(context);
                },
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Eliminar'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
