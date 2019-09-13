// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad ModelosCerraduras
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ModelosCerraduras {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<ModeloCerradura> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(MODELOSCERRADURAS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        ModeloCerradura modeloCerradura = ModeloCerradura();
        modeloCerradura.fromMap(mapa);
        laLista.add(modeloCerradura);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, ModeloCerradura modeloCerradura) async {
    Resultado _resultado = await DEM.api.getRecord(MODELOSCERRADURAS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      modeloCerradura.fromMap(_resultado.objeto);
      _resultado.objeto = modeloCerradura;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(ModeloCerradura modeloCerradura) async {
    Resultado _resultado;
    Map mapa = modeloCerradura.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (modeloCerradura.id == null || modeloCerradura.id == 0) {
      _resultado = await DEM.api.postRecord(
          MODELOSCERRADURAS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          MODELOSCERRADURAS.ENDPOINT.toLowerCase() + modeloCerradura.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      modeloCerradura.fromMap(_objeto);  
      _resultado.objeto = modeloCerradura;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(ModeloCerradura modeloCerradura) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        MODELOSCERRADURAS.ENDPOINT.toLowerCase() + modeloCerradura.id.toString());
    if (_resultado.estado == Co.OK) {
      modeloCerradura.fromMap(_resultado.objeto);
      _resultado.objeto = modeloCerradura;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<ModeloCerradura> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
