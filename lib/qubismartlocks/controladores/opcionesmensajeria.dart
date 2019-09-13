// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad OpcionesMensajeria
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class OpcionesMensajeria {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<OpcionMensajeria> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(OPCIONESMENSAJERIA.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        OpcionMensajeria opcionMensajeria = OpcionMensajeria();
        opcionMensajeria.fromMap(mapa);
        laLista.add(opcionMensajeria);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, OpcionMensajeria opcionMensajeria) async {
    Resultado _resultado = await DEM.api.getRecord(OPCIONESMENSAJERIA.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      opcionMensajeria.fromMap(_resultado.objeto);
      _resultado.objeto = opcionMensajeria;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(OpcionMensajeria opcionMensajeria) async {
    Resultado _resultado;
    Map mapa = opcionMensajeria.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (opcionMensajeria.id == null || opcionMensajeria.id == 0) {
      _resultado = await DEM.api.postRecord(
          OPCIONESMENSAJERIA.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          OPCIONESMENSAJERIA.ENDPOINT.toLowerCase() + opcionMensajeria.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      opcionMensajeria.fromMap(_objeto);  
      _resultado.objeto = opcionMensajeria;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(OpcionMensajeria opcionMensajeria) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        OPCIONESMENSAJERIA.ENDPOINT.toLowerCase() + opcionMensajeria.id.toString());
    if (_resultado.estado == Co.OK) {
      opcionMensajeria.fromMap(_resultado.objeto);
      _resultado.objeto = opcionMensajeria;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<OpcionMensajeria> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
