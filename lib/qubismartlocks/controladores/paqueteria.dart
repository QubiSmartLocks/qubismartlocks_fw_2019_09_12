// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Paqueteria
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Paqueteria {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Paquete> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(PAQUETERIA.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Paquete paquete = Paquete();
        paquete.fromMap(mapa);
        laLista.add(paquete);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Paquete paquete) async {
    Resultado _resultado = await DEM.api.getRecord(PAQUETERIA.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      paquete.fromMap(_resultado.objeto);
      _resultado.objeto = paquete;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Paquete paquete) async {
    Resultado _resultado;
    Map mapa = paquete.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (paquete.id == null || paquete.id == 0) {
      _resultado = await DEM.api.postRecord(
          PAQUETERIA.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          PAQUETERIA.ENDPOINT.toLowerCase() + paquete.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      paquete.fromMap(_objeto);  
      _resultado.objeto = paquete;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Paquete paquete) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        PAQUETERIA.ENDPOINT.toLowerCase() + paquete.id.toString());
    if (_resultado.estado == Co.OK) {
      paquete.fromMap(_resultado.objeto);
      _resultado.objeto = paquete;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Paquete> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
