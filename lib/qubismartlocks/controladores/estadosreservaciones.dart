// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad EstadosReservaciones
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class EstadosReservaciones {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<EstadoReservacion> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(ESTADOSRESERVACIONES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        EstadoReservacion estadoReservacion = EstadoReservacion();
        estadoReservacion.fromMap(mapa);
        laLista.add(estadoReservacion);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, EstadoReservacion estadoReservacion) async {
    Resultado _resultado = await DEM.api.getRecord(ESTADOSRESERVACIONES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      estadoReservacion.fromMap(_resultado.objeto);
      _resultado.objeto = estadoReservacion;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(EstadoReservacion estadoReservacion) async {
    Resultado _resultado;
    Map mapa = estadoReservacion.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (estadoReservacion.id == null || estadoReservacion.id == 0) {
      _resultado = await DEM.api.postRecord(
          ESTADOSRESERVACIONES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          ESTADOSRESERVACIONES.ENDPOINT.toLowerCase() + estadoReservacion.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      estadoReservacion.fromMap(_objeto);  
      _resultado.objeto = estadoReservacion;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(EstadoReservacion estadoReservacion) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        ESTADOSRESERVACIONES.ENDPOINT.toLowerCase() + estadoReservacion.id.toString());
    if (_resultado.estado == Co.OK) {
      estadoReservacion.fromMap(_resultado.objeto);
      _resultado.objeto = estadoReservacion;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<EstadoReservacion> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
