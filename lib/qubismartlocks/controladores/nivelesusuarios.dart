// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad NivelesUsuarios
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class NivelesUsuarios {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<NivelUsuario> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(NIVELESUSUARIOS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        NivelUsuario nivelUsuario = NivelUsuario();
        nivelUsuario.fromMap(mapa);
        laLista.add(nivelUsuario);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, NivelUsuario nivelUsuario) async {
    Resultado _resultado = await DEM.api.getRecord(NIVELESUSUARIOS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      nivelUsuario.fromMap(_resultado.objeto);
      _resultado.objeto = nivelUsuario;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(NivelUsuario nivelUsuario) async {
    Resultado _resultado;
    Map mapa = nivelUsuario.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (nivelUsuario.id == null || nivelUsuario.id == 0) {
      _resultado = await DEM.api.postRecord(
          NIVELESUSUARIOS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          NIVELESUSUARIOS.ENDPOINT.toLowerCase() + nivelUsuario.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      nivelUsuario.fromMap(_objeto);  
      _resultado.objeto = nivelUsuario;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(NivelUsuario nivelUsuario) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        NIVELESUSUARIOS.ENDPOINT.toLowerCase() + nivelUsuario.id.toString());
    if (_resultado.estado == Co.OK) {
      nivelUsuario.fromMap(_resultado.objeto);
      _resultado.objeto = nivelUsuario;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<NivelUsuario> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
