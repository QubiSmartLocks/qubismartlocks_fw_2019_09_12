// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Clientes
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Clientes {

  // ===========================================================================
  // Obtener todos los registros
  static Future<Resultado> todos(List<Cliente> laLista) async {

    Resultado _resultado = await DEM.api
        .getList(CLIENTES.ENDPOINT.toLowerCase());

    laLista.clear();
    if (_resultado.estado == Co.OK) {
      List<dynamic> listaTemporal = _resultado.objeto;
      listaTemporal.forEach((mapa) {
        Cliente cliente = Cliente();
        cliente.fromMap(mapa);
        laLista.add(cliente);
      });
    }
    return _resultado;
  }

  // ===========================================================================
  // Obtener un registro por Id
  static Future<Resultado> registro(int id, Cliente cliente) async {
    Resultado _resultado = await DEM.api.getRecord(CLIENTES.ENDPOINT.toLowerCase()+id.toString());
    if (_resultado.estado == Co.OK) {
      cliente.fromMap(_resultado.objeto);
      _resultado.objeto = cliente;
    }
    return _resultado;
  }

  // ===========================================================================
  // Guardar
  static Future<Resultado> guardar(Cliente cliente) async {
    Resultado _resultado;
    Map mapa = cliente.toMap();
    mapa.remove('id'); // No se puede enviar el id en el mapa a Dart, lo rechaza el API de Aqueduct
    if (cliente.id == null || cliente.id == 0) {
      _resultado = await DEM.api.postRecord(
          CLIENTES.ENDPOINT.toLowerCase(), mapa);
    } else {
      _resultado = await DEM.api.putRecord(
          CLIENTES.ENDPOINT.toLowerCase() + cliente.id.toString(),
          mapa);
    }
    if (_resultado.estado == Co.OK) {
      Map _objeto = _resultado.objeto;
      cliente.fromMap(_objeto);  
      _resultado.objeto = cliente;
    }
    return _resultado;
  }


  // ===========================================================================
  // Borrar
  static Future<Resultado> borrar(Cliente cliente) async {
    Resultado _resultado = await DEM.api.deleteRecord(
        CLIENTES.ENDPOINT.toLowerCase() + cliente.id.toString());
    if (_resultado.estado == Co.OK) {
      cliente.fromMap(_resultado.objeto);
      _resultado.objeto = cliente;
    }
    return _resultado;
  }

  static List<Map> toMapList(List<Cliente> lista) {
    List<Map> _listaMapa = List<Map>();
    lista.forEach((registro) {
      Map mapa = registro.toMap();
      _listaMapa.add(mapa);
    });
    return _listaMapa;
  }

}
