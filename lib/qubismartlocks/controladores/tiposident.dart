// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad TiposIdent
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class TiposIdent {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<TipoIdent> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(TIPOSIDENT.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        TipoIdent tipoIdent = TipoIdent();
        tipoIdent.fromMap(mapa);
        laLista.add(tipoIdent);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, TipoIdent tipoIdent) async {
    Resultado _resultado = await DEM.api.getRecord(TIPOSIDENT.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      tipoIdent.fromMap(_resultado.objeto);
      _resultado.objeto = tipoIdent;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(TipoIdent tipoIdent) async {
    Resultado _resultado;
    Map mapa = tipoIdent.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (tipoIdent.id == null || tipoIdent.id == 0) {
      _resultado = await DEM.api.postRecord(
          TIPOSIDENT.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          TIPOSIDENT.ENDPOINT.toLowerCase() + tipoIdent.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      tipoIdent.fromMap(_objeto);  
      _resultado.objeto = tipoIdent;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(TipoIdent tipoIdent) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        TIPOSIDENT.ENDPOINT.toLowerCase() + tipoIdent.id.toString());
    if (_resultado.estado == Co.OK) {
      tipoIdent.fromMap(_resultado.objeto);
      _resultado.objeto = tipoIdent;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<TipoIdent> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
