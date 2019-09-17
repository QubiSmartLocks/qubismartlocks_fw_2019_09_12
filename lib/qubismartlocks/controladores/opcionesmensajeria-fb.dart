/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad OpcionesMensajeria -> Opción de Mensajería
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class OpcionesMensajeriaFB {

  static fb.DatabaseReference drOpcionesMensajeria = DEM.db.ref( OPCIONESMENSAJERIA.ENTIDAD );

  static Future guardarOpcionMensajeria({OpcionMensajeria opcionMensajeria}) async {

    if (opcionMensajeria.key == '') {
      opcionMensajeria.key = drOpcionesMensajeria.push().key;
    }
    await drOpcionesMensajeria.child(opcionMensajeria.key).update(opcionMensajeria.toJson());
  }

  static Future borrarOpcionMensajeria({OpcionMensajeria opcionMensajeria}) async {
    await drOpcionesMensajeria.child(opcionMensajeria.key).remove();
  }

  static init() async {
    await drOpcionesMensajeria.remove();
    await InicializarOpcionesMensajeria.init();
  }

  static todos(List<OpcionMensajeria> lista) async {
    // Lista de Opciones de Mensajería
    lista.clear();
    drOpcionesMensajeria.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = OpcionMensajeria();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
