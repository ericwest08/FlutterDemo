class TareasProvider {
  List<Map<String, dynamic>> _tareas;

  static final TareasProvider _instancia = TareasProvider._privado();

  TareasProvider._privado() {
    _tareas = [];
  }

  factory TareasProvider() {
    return _instancia;
  }

  List<Map<String, dynamic>> get tareas {
    return _tareas;
  }

  void agregarTarea(Map<String, dynamic> nuevaTarea) {
    _tareas.add(nuevaTarea);
  }

  void editarTarea(
      Map<String, dynamic> nuevaTarea, Map<String, dynamic> antiguaTarea) {
    for (var i = 0; i < _tareas.length; i++) {
      if (_tareas[i] == antiguaTarea) {
        _tareas[i] = nuevaTarea;
        break;
      }
    }
  }

  void eliminarTarea(Map<String, dynamic> borrarTarea) {
    _tareas.remove(borrarTarea);
  }

  void terminarTarea(Map<String, dynamic> antiguaTarea) {
    for (var i = 0; i < _tareas.length; i++) {
      if (_tareas[i] == antiguaTarea) {
        antiguaTarea['estado'] = true;
        _tareas[i] = antiguaTarea;
        break;
      }
    }
  }
}
