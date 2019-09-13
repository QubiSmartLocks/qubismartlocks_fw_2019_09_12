// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad ModelosCampos
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ModelosCampos {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<ModeloCampo> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(MODELOSCAMPOS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        ModeloCampo modeloCampo = ModeloCampo();
        modeloCampo.fromMap(mapa);
        laLista.add(modeloCampo);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, ModeloCampo modeloCampo) async {
    Resultado _resultado = await DEM.api.getRecord(MODELOSCAMPOS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      modeloCampo.fromMap(_resultado.objeto);
      _resultado.objeto = modeloCampo;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(ModeloCampo modeloCampo) async {
    Resultado _resultado;
    Map mapa = modeloCampo.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (modeloCampo.id == null || modeloCampo.id == 0) {
      _resultado = await DEM.api.postRecord(
          MODELOSCAMPOS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          MODELOSCAMPOS.ENDPOINT.toLowerCase() + modeloCampo.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      modeloCampo.fromMap(_objeto);  
      _resultado.objeto = modeloCampo;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(ModeloCampo modeloCampo) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        MODELOSCAMPOS.ENDPOINT.toLowerCase() + modeloCampo.id.toString());
    if (_resultado.estado == Co.OK) {
      modeloCampo.fromMap(_resultado.objeto);
      _resultado.objeto = modeloCampo;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<ModeloCampo> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
