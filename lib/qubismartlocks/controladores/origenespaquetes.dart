// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad OrigenesPaquetes
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class OrigenesPaquetes {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<OrigenPaquete> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(ORIGENESPAQUETES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        OrigenPaquete origenPaquete = OrigenPaquete();
        origenPaquete.fromMap(mapa);
        laLista.add(origenPaquete);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, OrigenPaquete origenPaquete) async {
    Resultado _resultado = await DEM.api.getRecord(ORIGENESPAQUETES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      origenPaquete.fromMap(_resultado.objeto);
      _resultado.objeto = origenPaquete;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(OrigenPaquete origenPaquete) async {
    Resultado _resultado;
    Map mapa = origenPaquete.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (origenPaquete.id == null || origenPaquete.id == 0) {
      _resultado = await DEM.api.postRecord(
          ORIGENESPAQUETES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          ORIGENESPAQUETES.ENDPOINT.toLowerCase() + origenPaquete.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      origenPaquete.fromMap(_objeto);  
      _resultado.objeto = origenPaquete;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(OrigenPaquete origenPaquete) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        ORIGENESPAQUETES.ENDPOINT.toLowerCase() + origenPaquete.id.toString());
    if (_resultado.estado == Co.OK) {
      origenPaquete.fromMap(_resultado.objeto);
      _resultado.objeto = origenPaquete;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<OrigenPaquete> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
