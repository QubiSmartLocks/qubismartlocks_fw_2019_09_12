// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad TipUnidadesFuncionales
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class TipUnidadesFuncionales {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<TipoUnidadFuncional> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(TIPUNIDADESFUNCIONALES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        TipoUnidadFuncional tipoUnidadFuncional = TipoUnidadFuncional();
        tipoUnidadFuncional.fromMap(mapa);
        laLista.add(tipoUnidadFuncional);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, TipoUnidadFuncional tipoUnidadFuncional) async {
    Resultado _resultado = await DEM.api.getRecord(TIPUNIDADESFUNCIONALES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      tipoUnidadFuncional.fromMap(_resultado.objeto);
      _resultado.objeto = tipoUnidadFuncional;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(TipoUnidadFuncional tipoUnidadFuncional) async {
    Resultado _resultado;
    Map mapa = tipoUnidadFuncional.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (tipoUnidadFuncional.id == null || tipoUnidadFuncional.id == 0) {
      _resultado = await DEM.api.postRecord(
          TIPUNIDADESFUNCIONALES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          TIPUNIDADESFUNCIONALES.ENDPOINT.toLowerCase() + tipoUnidadFuncional.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      tipoUnidadFuncional.fromMap(_objeto);  
      _resultado.objeto = tipoUnidadFuncional;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(TipoUnidadFuncional tipoUnidadFuncional) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        TIPUNIDADESFUNCIONALES.ENDPOINT.toLowerCase() + tipoUnidadFuncional.id.toString());
    if (_resultado.estado == Co.OK) {
      tipoUnidadFuncional.fromMap(_resultado.objeto);
      _resultado.objeto = tipoUnidadFuncional;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<TipoUnidadFuncional> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
