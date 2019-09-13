// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Mensajes
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Mensajes {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Mensaje> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(MENSAJES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Mensaje mensaje = Mensaje();
        mensaje.fromMap(mapa);
        laLista.add(mensaje);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Mensaje mensaje) async {
    Resultado _resultado = await DEM.api.getRecord(MENSAJES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      mensaje.fromMap(_resultado.objeto);
      _resultado.objeto = mensaje;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Mensaje mensaje) async {
    Resultado _resultado;
    Map mapa = mensaje.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (mensaje.id == null || mensaje.id == 0) {
      _resultado = await DEM.api.postRecord(
          MENSAJES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          MENSAJES.ENDPOINT.toLowerCase() + mensaje.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      mensaje.fromMap(_objeto);  
      _resultado.objeto = mensaje;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Mensaje mensaje) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        MENSAJES.ENDPOINT.toLowerCase() + mensaje.id.toString());
    if (_resultado.estado == Co.OK) {
      mensaje.fromMap(_resultado.objeto);
      _resultado.objeto = mensaje;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Mensaje> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
