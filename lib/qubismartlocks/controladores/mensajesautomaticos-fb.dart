/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad MensajesAutomaticos -> Mensaje Automático
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class MensajesAutomaticosFB {

  static fb.DatabaseReference drMensajesAutomaticos = DEM.db.ref( MENSAJESAUTOMATICOS.ENTIDAD );

  static Future guardarMensajeAutomatico({MensajeAutomatico mensajeAutomatico}) async {

    if (mensajeAutomatico.key == '') {
      mensajeAutomatico.key = drMensajesAutomaticos.push().key;
    }
    await drMensajesAutomaticos.child(mensajeAutomatico.key).update(mensajeAutomatico.toJson());
  }

  static Future borrarMensajeAutomatico({MensajeAutomatico mensajeAutomatico}) async {
    await drMensajesAutomaticos.child(mensajeAutomatico.key).remove();
  }

  static init() async {
    await drMensajesAutomaticos.remove();
    await InicializarMensajesAutomaticos.init();
  }

  static todos(List<MensajeAutomatico> lista) async {
    // Lista de Mensajes Automáticos
    lista.clear();
    drMensajesAutomaticos.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = MensajeAutomatico();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
