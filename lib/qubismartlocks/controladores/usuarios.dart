// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Usuarios
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Usuarios {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Usuario> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(USUARIOS.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Usuario usuario = Usuario();
        usuario.fromMap(mapa);
        laLista.add(usuario);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Usuario usuario) async {
    Resultado _resultado = await DEM.api.getRecord(USUARIOS.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      usuario.fromMap(_resultado.objeto);
      _resultado.objeto = usuario;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Usuario usuario) async {
    Resultado _resultado;
    Map mapa = usuario.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (usuario.id == null || usuario.id == 0) {
      _resultado = await DEM.api.postRecord(
          USUARIOS.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          USUARIOS.ENDPOINT.toLowerCase() + usuario.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      usuario.fromMap(_objeto);  
      _resultado.objeto = usuario;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Usuario usuario) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        USUARIOS.ENDPOINT.toLowerCase() + usuario.id.toString());
    if (_resultado.estado == Co.OK) {
      usuario.fromMap(_resultado.objeto);
      _resultado.objeto = usuario;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Usuario> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
