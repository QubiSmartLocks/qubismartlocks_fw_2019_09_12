// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Participantes
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Participantes {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Participante> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(PARTICIPANTES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Participante participante = Participante();
        participante.fromMap(mapa);
        laLista.add(participante);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Participante participante) async {
    Resultado _resultado = await DEM.api.getRecord(PARTICIPANTES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      participante.fromMap(_resultado.objeto);
      _resultado.objeto = participante;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Participante participante) async {
    Resultado _resultado;
    Map mapa = participante.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (participante.id == null || participante.id == 0) {
      _resultado = await DEM.api.postRecord(
          PARTICIPANTES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          PARTICIPANTES.ENDPOINT.toLowerCase() + participante.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      participante.fromMap(_objeto);  
      _resultado.objeto = participante;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Participante participante) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        PARTICIPANTES.ENDPOINT.toLowerCase() + participante.id.toString());
    if (_resultado.estado == Co.OK) {
      participante.fromMap(_resultado.objeto);
      _resultado.objeto = participante;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Participante> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
