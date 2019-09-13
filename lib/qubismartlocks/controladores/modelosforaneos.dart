// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad ModelosForaneos
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ModelosForaneos {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<ModeloForaneo> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(MODELOSFORANEOS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        ModeloForaneo modeloForaneo = ModeloForaneo();
        modeloForaneo.fromMap(mapa);
        laLista.add(modeloForaneo);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, ModeloForaneo modeloForaneo) async {
    Resultado _resultado = await DEM.api.getRecord(MODELOSFORANEOS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      modeloForaneo.fromMap(_resultado.objeto);
      _resultado.objeto = modeloForaneo;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(ModeloForaneo modeloForaneo) async {
    Resultado _resultado;
    Map mapa = modeloForaneo.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (modeloForaneo.id == null || modeloForaneo.id == 0) {
      _resultado = await DEM.api.postRecord(
          MODELOSFORANEOS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          MODELOSFORANEOS.ENDPOINT.toLowerCase() + modeloForaneo.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      modeloForaneo.fromMap(_objeto);  
      _resultado.objeto = modeloForaneo;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(ModeloForaneo modeloForaneo) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        MODELOSFORANEOS.ENDPOINT.toLowerCase() + modeloForaneo.id.toString());
    if (_resultado.estado == Co.OK) {
      modeloForaneo.fromMap(_resultado.objeto);
      _resultado.objeto = modeloForaneo;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<ModeloForaneo> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
