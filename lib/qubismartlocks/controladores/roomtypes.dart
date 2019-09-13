// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad RoomTypes
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class RoomTypes {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<RoomType> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(ROOMTYPES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        RoomType roomType = RoomType();
        roomType.fromMap(mapa);
        laLista.add(roomType);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, RoomType roomType) async {
    Resultado _resultado = await DEM.api.getRecord(ROOMTYPES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      roomType.fromMap(_resultado.objeto);
      _resultado.objeto = roomType;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(RoomType roomType) async {
    Resultado _resultado;
    Map mapa = roomType.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (roomType.id == null || roomType.id == 0) {
      _resultado = await DEM.api.postRecord(
          ROOMTYPES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          ROOMTYPES.ENDPOINT.toLowerCase() + roomType.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      roomType.fromMap(_objeto);  
      _resultado.objeto = roomType;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(RoomType roomType) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        ROOMTYPES.ENDPOINT.toLowerCase() + roomType.id.toString());
    if (_resultado.estado == Co.OK) {
      roomType.fromMap(_resultado.objeto);
      _resultado.objeto = roomType;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<RoomType> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
