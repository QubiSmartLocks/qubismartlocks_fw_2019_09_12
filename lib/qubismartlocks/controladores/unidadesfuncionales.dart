// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad UnidadesFuncionales
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UnidadesFuncionales {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<UnidadFuncional> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(UNIDADESFUNCIONALES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        UnidadFuncional unidadFuncional = UnidadFuncional();
        unidadFuncional.fromMap(mapa);
        laLista.add(unidadFuncional);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, UnidadFuncional unidadFuncional) async {
    Resultado _resultado = await DEM.api.getRecord(UNIDADESFUNCIONALES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      unidadFuncional.fromMap(_resultado.objeto);
      _resultado.objeto = unidadFuncional;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(UnidadFuncional unidadFuncional) async {
    Resultado _resultado;
    Map mapa = unidadFuncional.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (unidadFuncional.id == null || unidadFuncional.id == 0) {
      _resultado = await DEM.api.postRecord(
          UNIDADESFUNCIONALES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          UNIDADESFUNCIONALES.ENDPOINT.toLowerCase() + unidadFuncional.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      unidadFuncional.fromMap(_objeto);  
      _resultado.objeto = unidadFuncional;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(UnidadFuncional unidadFuncional) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        UNIDADESFUNCIONALES.ENDPOINT.toLowerCase() + unidadFuncional.id.toString());
    if (_resultado.estado == Co.OK) {
      unidadFuncional.fromMap(_resultado.objeto);
      _resultado.objeto = unidadFuncional;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<UnidadFuncional> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
