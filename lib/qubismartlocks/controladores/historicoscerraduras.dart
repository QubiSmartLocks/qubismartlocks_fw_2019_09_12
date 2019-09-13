// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad HistoricosCerraduras
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class HistoricosCerraduras {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<HistoricoCerradura> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(HISTORICOSCERRADURAS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        HistoricoCerradura historicoCerradura = HistoricoCerradura();
        historicoCerradura.fromMap(mapa);
        laLista.add(historicoCerradura);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, HistoricoCerradura historicoCerradura) async {
    Resultado _resultado = await DEM.api.getRecord(HISTORICOSCERRADURAS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      historicoCerradura.fromMap(_resultado.objeto);
      _resultado.objeto = historicoCerradura;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(HistoricoCerradura historicoCerradura) async {
    Resultado _resultado;
    Map mapa = historicoCerradura.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (historicoCerradura.id == null || historicoCerradura.id == 0) {
      _resultado = await DEM.api.postRecord(
          HISTORICOSCERRADURAS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          HISTORICOSCERRADURAS.ENDPOINT.toLowerCase() + historicoCerradura.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      historicoCerradura.fromMap(_objeto);  
      _resultado.objeto = historicoCerradura;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(HistoricoCerradura historicoCerradura) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        HISTORICOSCERRADURAS.ENDPOINT.toLowerCase() + historicoCerradura.id.toString());
    if (_resultado.estado == Co.OK) {
      historicoCerradura.fromMap(_resultado.objeto);
      _resultado.objeto = historicoCerradura;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<HistoricoCerradura> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
