// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad EstadosCerraduras
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class EstadosCerraduras {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<EstadoCerradura> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(ESTADOSCERRADURAS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        EstadoCerradura estadoCerradura = EstadoCerradura();
        estadoCerradura.fromMap(mapa);
        laLista.add(estadoCerradura);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, EstadoCerradura estadoCerradura) async {
    Resultado _resultado = await DEM.api.getRecord(ESTADOSCERRADURAS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      estadoCerradura.fromMap(_resultado.objeto);
      _resultado.objeto = estadoCerradura;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(EstadoCerradura estadoCerradura) async {
    Resultado _resultado;
    Map mapa = estadoCerradura.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (estadoCerradura.id == null || estadoCerradura.id == 0) {
      _resultado = await DEM.api.postRecord(
          ESTADOSCERRADURAS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          ESTADOSCERRADURAS.ENDPOINT.toLowerCase() + estadoCerradura.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      estadoCerradura.fromMap(_objeto);  
      _resultado.objeto = estadoCerradura;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(EstadoCerradura estadoCerradura) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        ESTADOSCERRADURAS.ENDPOINT.toLowerCase() + estadoCerradura.id.toString());
    if (_resultado.estado == Co.OK) {
      estadoCerradura.fromMap(_resultado.objeto);
      _resultado.objeto = estadoCerradura;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<EstadoCerradura> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
