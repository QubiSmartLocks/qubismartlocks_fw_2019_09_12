// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Propietarios
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Propietarios {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Propietario> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(PROPIETARIOS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Propietario propietario = Propietario();
        propietario.fromMap(mapa);
        laLista.add(propietario);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Propietario propietario) async {
    Resultado _resultado = await DEM.api.getRecord(PROPIETARIOS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      propietario.fromMap(_resultado.objeto);
      _resultado.objeto = propietario;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Propietario propietario) async {
    Resultado _resultado;
    Map mapa = propietario.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (propietario.id == null || propietario.id == 0) {
      _resultado = await DEM.api.postRecord(
          PROPIETARIOS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          PROPIETARIOS.ENDPOINT.toLowerCase() + propietario.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      propietario.fromMap(_objeto);  
      _resultado.objeto = propietario;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Propietario propietario) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        PROPIETARIOS.ENDPOINT.toLowerCase() + propietario.id.toString());
    if (_resultado.estado == Co.OK) {
      propietario.fromMap(_resultado.objeto);
      _resultado.objeto = propietario;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Propietario> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
