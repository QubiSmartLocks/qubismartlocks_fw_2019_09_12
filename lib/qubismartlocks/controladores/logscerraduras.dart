// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad LogsCerraduras
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class LogsCerraduras {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<LogCerradura> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(LOGSCERRADURAS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        LogCerradura logCerradura = LogCerradura();
        logCerradura.fromMap(mapa);
        laLista.add(logCerradura);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, LogCerradura logCerradura) async {
    Resultado _resultado = await DEM.api.getRecord(LOGSCERRADURAS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      logCerradura.fromMap(_resultado.objeto);
      _resultado.objeto = logCerradura;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(LogCerradura logCerradura) async {
    Resultado _resultado;
    Map mapa = logCerradura.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (logCerradura.id == null || logCerradura.id == 0) {
      _resultado = await DEM.api.postRecord(
          LOGSCERRADURAS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          LOGSCERRADURAS.ENDPOINT.toLowerCase() + logCerradura.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      logCerradura.fromMap(_objeto);  
      _resultado.objeto = logCerradura;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(LogCerradura logCerradura) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        LOGSCERRADURAS.ENDPOINT.toLowerCase() + logCerradura.id.toString());
    if (_resultado.estado == Co.OK) {
      logCerradura.fromMap(_resultado.objeto);
      _resultado.objeto = logCerradura;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<LogCerradura> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
