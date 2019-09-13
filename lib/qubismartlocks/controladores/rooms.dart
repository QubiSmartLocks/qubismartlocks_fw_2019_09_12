// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Rooms
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Rooms {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Room> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(ROOMS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Room room = Room();
        room.fromMap(mapa);
        laLista.add(room);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Room room) async {
    Resultado _resultado = await DEM.api.getRecord(ROOMS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      room.fromMap(_resultado.objeto);
      _resultado.objeto = room;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Room room) async {
    Resultado _resultado;
    Map mapa = room.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (room.id == null || room.id == 0) {
      _resultado = await DEM.api.postRecord(
          ROOMS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          ROOMS.ENDPOINT.toLowerCase() + room.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      room.fromMap(_objeto);  
      _resultado.objeto = room;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Room room) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        ROOMS.ENDPOINT.toLowerCase() + room.id.toString());
    if (_resultado.estado == Co.OK) {
      room.fromMap(_resultado.objeto);
      _resultado.objeto = room;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Room> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
