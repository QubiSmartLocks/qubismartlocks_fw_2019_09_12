// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad ZonasEdificaciones
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ZonasEdificaciones {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<ZonaEdificacion> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(ZONASEDIFICACIONES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        ZonaEdificacion zonaEdificacion = ZonaEdificacion();
        zonaEdificacion.fromMap(mapa);
        laLista.add(zonaEdificacion);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, ZonaEdificacion zonaEdificacion) async {
    Resultado _resultado = await DEM.api.getRecord(ZONASEDIFICACIONES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      zonaEdificacion.fromMap(_resultado.objeto);
      _resultado.objeto = zonaEdificacion;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(ZonaEdificacion zonaEdificacion) async {
    Resultado _resultado;
    Map mapa = zonaEdificacion.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (zonaEdificacion.id == null || zonaEdificacion.id == 0) {
      _resultado = await DEM.api.postRecord(
          ZONASEDIFICACIONES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          ZONASEDIFICACIONES.ENDPOINT.toLowerCase() + zonaEdificacion.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      zonaEdificacion.fromMap(_objeto);  
      _resultado.objeto = zonaEdificacion;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(ZonaEdificacion zonaEdificacion) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        ZONASEDIFICACIONES.ENDPOINT.toLowerCase() + zonaEdificacion.id.toString());
    if (_resultado.estado == Co.OK) {
      zonaEdificacion.fromMap(_resultado.objeto);
      _resultado.objeto = zonaEdificacion;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<ZonaEdificacion> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
