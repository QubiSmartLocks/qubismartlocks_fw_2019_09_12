// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Clientes
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ClientesConsultasControlador {

  // ===========================================================================
  // Obtener todos los registros que CONTENGAN (LIKE) un texto en Nombre y/o Apellido
  static Future<Resultado> buscarNombreApellidos(List<Cliente> laLista, String textoABuscar) async {

    Resultado _resultado = await DEM.api
        .getList('clientes_consulta/'+textoABuscar);

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

}
