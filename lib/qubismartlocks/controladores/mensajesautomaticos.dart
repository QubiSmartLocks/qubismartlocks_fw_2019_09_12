// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad MensajesAutomaticos
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class MensajesAutomaticos {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<MensajeAutomatico> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(MENSAJESAUTOMATICOS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        MensajeAutomatico mensajeAutomatico = MensajeAutomatico();
        mensajeAutomatico.fromMap(mapa);
        laLista.add(mensajeAutomatico);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, MensajeAutomatico mensajeAutomatico) async {
    Resultado _resultado = await DEM.api.getRecord(MENSAJESAUTOMATICOS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      mensajeAutomatico.fromMap(_resultado.objeto);
      _resultado.objeto = mensajeAutomatico;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(MensajeAutomatico mensajeAutomatico) async {
    Resultado _resultado;
    Map mapa = mensajeAutomatico.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (mensajeAutomatico.id == null || mensajeAutomatico.id == 0) {
      _resultado = await DEM.api.postRecord(
          MENSAJESAUTOMATICOS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          MENSAJESAUTOMATICOS.ENDPOINT.toLowerCase() + mensajeAutomatico.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      mensajeAutomatico.fromMap(_objeto);  
      _resultado.objeto = mensajeAutomatico;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(MensajeAutomatico mensajeAutomatico) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        MENSAJESAUTOMATICOS.ENDPOINT.toLowerCase() + mensajeAutomatico.id.toString());
    if (_resultado.estado == Co.OK) {
      mensajeAutomatico.fromMap(_resultado.objeto);
      _resultado.objeto = mensajeAutomatico;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<MensajeAutomatico> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
