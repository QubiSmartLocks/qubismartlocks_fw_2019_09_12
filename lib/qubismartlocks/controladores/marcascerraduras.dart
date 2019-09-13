// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad MarcasCerraduras
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class MarcasCerraduras {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<MarcaCerradura> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(MARCASCERRADURAS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        MarcaCerradura marcaCerradura = MarcaCerradura();
        marcaCerradura.fromMap(mapa);
        laLista.add(marcaCerradura);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, MarcaCerradura marcaCerradura) async {
    Resultado _resultado = await DEM.api.getRecord(MARCASCERRADURAS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      marcaCerradura.fromMap(_resultado.objeto);
      _resultado.objeto = marcaCerradura;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(MarcaCerradura marcaCerradura) async {
    Resultado _resultado;
    Map mapa = marcaCerradura.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (marcaCerradura.id == null || marcaCerradura.id == 0) {
      _resultado = await DEM.api.postRecord(
          MARCASCERRADURAS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          MARCASCERRADURAS.ENDPOINT.toLowerCase() + marcaCerradura.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      marcaCerradura.fromMap(_objeto);  
      _resultado.objeto = marcaCerradura;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(MarcaCerradura marcaCerradura) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        MARCASCERRADURAS.ENDPOINT.toLowerCase() + marcaCerradura.id.toString());
    if (_resultado.estado == Co.OK) {
      marcaCerradura.fromMap(_resultado.objeto);
      _resultado.objeto = marcaCerradura;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<MarcaCerradura> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
