import 'package:basiclist/src/pages/listado.dart';
import 'package:basiclist/src/providers/tareas_provider.dart';
import 'package:flutter/material.dart';

class FormularioPage extends StatefulWidget {
  FormularioPage({Key key}) : super(key: key);
  static final nombrePagina = 'formulario';
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final idform = GlobalKey<FormState>();

  Map<String, dynamic> nuevaTarea = {};

  Map<String, dynamic> tarea = {};

  @override
  Widget build(BuildContext context) {
    tarea = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Formulario'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Form(
                key: idform,
                child: Column(
                  children: <Widget>[
                    _crearInputNombre(),
                    _crearInputDescripcion(),
                    _crearBotonAgregar(context)
                  ],
                )),
          ),
        ));
  }

  _crearInputNombre() {
    return TextFormField(
      initialValue: (tarea != null) ? tarea['nombre'] : '',
      onSaved: (valor) {
        nuevaTarea['nombre'] = valor;
      },
      decoration: InputDecoration(hintText: 'Nombre de la Tarea'),
    );
  }

  _crearInputDescripcion() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextFormField(
          initialValue: (tarea != null) ? tarea['descripcion'] : '',
          onSaved: (valor) {
            nuevaTarea['descripcion'] = valor;
          },
          maxLines: null,
          decoration: InputDecoration(hintText: 'Descripción de la tarea')),
    );
  }

  _crearBotonAgregar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: ElevatedButton(
          onPressed: () {
            idform.currentState.save();
            nuevaTarea['estado'] = false;
            if (tarea != null) {
              TareasProvider().editarTarea(nuevaTarea, tarea);
              Navigator.popUntil(
                  context,
                  ModalRoute.withName(ListadoPage
                      .nombreruta)); //Devuelve hasta encontrar ruta descrita
            } else {
              TareasProvider().agregarTarea(nuevaTarea);
              Navigator.pop(context);
            }
          },
          child: (tarea != null) ? Text('Editar Tarea') : Text('Crear Tarea'),
        ));
  }
}
