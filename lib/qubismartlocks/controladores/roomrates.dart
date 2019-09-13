// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad RoomRates
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class RoomRates {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<RoomRate> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(ROOMRATES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        RoomRate roomRate = RoomRate();
        roomRate.fromMap(mapa);
        laLista.add(roomRate);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, RoomRate roomRate) async {
    Resultado _resultado = await DEM.api.getRecord(ROOMRATES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      roomRate.fromMap(_resultado.objeto);
      _resultado.objeto = roomRate;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(RoomRate roomRate) async {
    Resultado _resultado;
    Map mapa = roomRate.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (roomRate.id == null || roomRate.id == 0) {
      _resultado = await DEM.api.postRecord(
          ROOMRATES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          ROOMRATES.ENDPOINT.toLowerCase() + roomRate.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      roomRate.fromMap(_objeto);  
      _resultado.objeto = roomRate;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(RoomRate roomRate) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        ROOMRATES.ENDPOINT.toLowerCase() + roomRate.id.toString());
    if (_resultado.estado == Co.OK) {
      roomRate.fromMap(_resultado.objeto);
      _resultado.objeto = roomRate;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<RoomRate> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
