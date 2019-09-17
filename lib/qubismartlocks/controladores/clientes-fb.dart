/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Clientes -> Cliente
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class ClientesFB {

  static fb.DatabaseReference drClientes = DEM.db.ref( CLIENTES.ENTIDAD );

  static Future guardarCliente({Cliente cliente}) async {

    if (cliente.key == '') {
      cliente.key = drClientes.push().key;
    }
    await drClientes.child(cliente.key).update(cliente.toJson());
  }

  static Future borrarCliente({Cliente cliente}) async {
    await drClientes.child(cliente.key).remove();
  }

  static init() async {
    await drClientes.remove();
    await InicializarClientes.init();
  }

  static todos(List<Cliente> lista) async {
    // Lista de Clientes
    lista.clear();
    drClientes.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Cliente();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
