/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Clientes -> Inicializar Cliente
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarClientes {
  static init() async {
    int i = 1;
    Cliente _cliente;

    _cliente = new Cliente();
    _cliente.id = i++;
    _cliente.nombres = '';
    _cliente.apellidos = '';
    _cliente.tipoIdent = DEM.listaTiposIdent[0];
    _cliente.docIdent = '';
    _cliente.telefono = '';
    _cliente.correoElectronico = '';
    // Guarda usando el API
//    await Clientes.guardar(_cliente);
    // Guarda usando Firebase Realtime Database
//    await ClientesFB.guardarCliente(cliente: _cliente);
    DEM.listaClientes.add(_cliente);

  }
}
