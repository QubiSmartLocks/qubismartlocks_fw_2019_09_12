// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Cerraduras
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Cerraduras {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Cerradura> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(CERRADURAS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Cerradura cerradura = Cerradura();
        cerradura.fromMap(mapa);
        laLista.add(cerradura);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Cerradura cerradura) async {
    Resultado _resultado = await DEM.api.getRecord(CERRADURAS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      cerradura.fromMap(_resultado.objeto);
      _resultado.objeto = cerradura;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Cerradura cerradura) async {
    Resultado _resultado;
    Map mapa = cerradura.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (cerradura.id == null || cerradura.id == 0) {
      _resultado = await DEM.api.postRecord(
          CERRADURAS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          CERRADURAS.ENDPOINT.toLowerCase() + cerradura.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      cerradura.fromMap(_objeto);  
      _resultado.objeto = cerradura;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Cerradura cerradura) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        CERRADURAS.ENDPOINT.toLowerCase() + cerradura.id.toString());
    if (_resultado.estado == Co.OK) {
      cerradura.fromMap(_resultado.objeto);
      _resultado.objeto = cerradura;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Cerradura> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
