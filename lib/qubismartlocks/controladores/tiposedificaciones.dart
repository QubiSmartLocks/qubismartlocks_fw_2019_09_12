// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad TiposEdificaciones
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class TiposEdificaciones {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<TipoEdificacion> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(TIPOSEDIFICACIONES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        TipoEdificacion tipoEdificacion = TipoEdificacion();
        tipoEdificacion.fromMap(mapa);
        laLista.add(tipoEdificacion);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, TipoEdificacion tipoEdificacion) async {
    Resultado _resultado = await DEM.api.getRecord(TIPOSEDIFICACIONES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      tipoEdificacion.fromMap(_resultado.objeto);
      _resultado.objeto = tipoEdificacion;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(TipoEdificacion tipoEdificacion) async {
    Resultado _resultado;
    Map mapa = tipoEdificacion.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (tipoEdificacion.id == null || tipoEdificacion.id == 0) {
      _resultado = await DEM.api.postRecord(
          TIPOSEDIFICACIONES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          TIPOSEDIFICACIONES.ENDPOINT.toLowerCase() + tipoEdificacion.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      tipoEdificacion.fromMap(_objeto);  
      _resultado.objeto = tipoEdificacion;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(TipoEdificacion tipoEdificacion) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        TIPOSEDIFICACIONES.ENDPOINT.toLowerCase() + tipoEdificacion.id.toString());
    if (_resultado.estado == Co.OK) {
      tipoEdificacion.fromMap(_resultado.objeto);
      _resultado.objeto = tipoEdificacion;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<TipoEdificacion> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
