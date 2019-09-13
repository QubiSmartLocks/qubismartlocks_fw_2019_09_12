// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Reservaciones
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Reservaciones {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Reservacion> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(RESERVACIONES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Reservacion reservacion = Reservacion();
        reservacion.fromMap(mapa);
        laLista.add(reservacion);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Reservacion reservacion) async {
    Resultado _resultado = await DEM.api.getRecord(RESERVACIONES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      reservacion.fromMap(_resultado.objeto);
      _resultado.objeto = reservacion;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Reservacion reservacion) async {
    Resultado _resultado;
    Map mapa = reservacion.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (reservacion.id == null || reservacion.id == 0) {
      _resultado = await DEM.api.postRecord(
          RESERVACIONES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          RESERVACIONES.ENDPOINT.toLowerCase() + reservacion.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      reservacion.fromMap(_objeto);  
      _resultado.objeto = reservacion;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Reservacion reservacion) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        RESERVACIONES.ENDPOINT.toLowerCase() + reservacion.id.toString());
    if (_resultado.estado == Co.OK) {
      reservacion.fromMap(_resultado.objeto);
      _resultado.objeto = reservacion;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Reservacion> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
