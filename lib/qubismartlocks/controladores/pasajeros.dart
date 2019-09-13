// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Pasajeros
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Pasajeros {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Pasajero> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(PASAJEROS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Pasajero pasajero = Pasajero();
        pasajero.fromMap(mapa);
        laLista.add(pasajero);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Pasajero pasajero) async {
    Resultado _resultado = await DEM.api.getRecord(PASAJEROS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      pasajero.fromMap(_resultado.objeto);
      _resultado.objeto = pasajero;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Pasajero pasajero) async {
    Resultado _resultado;
    Map mapa = pasajero.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (pasajero.id == null || pasajero.id == 0) {
      _resultado = await DEM.api.postRecord(
          PASAJEROS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          PASAJEROS.ENDPOINT.toLowerCase() + pasajero.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      pasajero.fromMap(_objeto);  
      _resultado.objeto = pasajero;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Pasajero pasajero) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        PASAJEROS.ENDPOINT.toLowerCase() + pasajero.id.toString());
    if (_resultado.estado == Co.OK) {
      pasajero.fromMap(_resultado.objeto);
      _resultado.objeto = pasajero;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Pasajero> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
