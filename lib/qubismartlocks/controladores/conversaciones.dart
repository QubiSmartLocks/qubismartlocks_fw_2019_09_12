// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Conversaciones
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Conversaciones {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Conversacion> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(CONVERSACIONES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Conversacion conversacion = Conversacion();
        conversacion.fromMap(mapa);
        laLista.add(conversacion);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Conversacion conversacion) async {
    Resultado _resultado = await DEM.api.getRecord(CONVERSACIONES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      conversacion.fromMap(_resultado.objeto);
      _resultado.objeto = conversacion;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Conversacion conversacion) async {
    Resultado _resultado;
    Map mapa = conversacion.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (conversacion.id == null || conversacion.id == 0) {
      _resultado = await DEM.api.postRecord(
          CONVERSACIONES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          CONVERSACIONES.ENDPOINT.toLowerCase() + conversacion.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      conversacion.fromMap(_objeto);  
      _resultado.objeto = conversacion;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Conversacion conversacion) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        CONVERSACIONES.ENDPOINT.toLowerCase() + conversacion.id.toString());
    if (_resultado.estado == Co.OK) {
      conversacion.fromMap(_resultado.objeto);
      _resultado.objeto = conversacion;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Conversacion> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
