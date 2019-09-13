// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Edificaciones
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Edificaciones {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Edificacion> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(EDIFICACIONES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Edificacion edificacion = Edificacion();
        edificacion.fromMap(mapa);
        laLista.add(edificacion);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Edificacion edificacion) async {
    Resultado _resultado = await DEM.api.getRecord(EDIFICACIONES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      edificacion.fromMap(_resultado.objeto);
      _resultado.objeto = edificacion;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Edificacion edificacion) async {
    Resultado _resultado;
    Map mapa = edificacion.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (edificacion.id == null || edificacion.id == 0) {
      _resultado = await DEM.api.postRecord(
          EDIFICACIONES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          EDIFICACIONES.ENDPOINT.toLowerCase() + edificacion.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      edificacion.fromMap(_objeto);  
      _resultado.objeto = edificacion;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Edificacion edificacion) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        EDIFICACIONES.ENDPOINT.toLowerCase() + edificacion.id.toString());
    if (_resultado.estado == Co.OK) {
      edificacion.fromMap(_resultado.objeto);
      _resultado.objeto = edificacion;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Edificacion> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
