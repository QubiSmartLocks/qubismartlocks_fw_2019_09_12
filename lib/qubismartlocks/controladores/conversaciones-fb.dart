/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Conversaciones -> Conversación
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class ConversacionesFB {

  static fb.DatabaseReference drConversaciones = DEM.db.ref( CONVERSACIONES.ENTIDAD );

  static Future guardarConversacion({Conversacion conversacion}) async {

    if (conversacion.key == '') {
      conversacion.key = drConversaciones.push().key;
    }
    await drConversaciones.child(conversacion.key).update(conversacion.toJson());
  }

  static Future borrarConversacion({Conversacion conversacion}) async {
    await drConversaciones.child(conversacion.key).remove();
  }

  static init() async {
    await drConversaciones.remove();
    await InicializarConversaciones.init();
  }

  static todos(List<Conversacion> lista) async {
    // Lista de Conversaciones
    lista.clear();
    drConversaciones.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Conversacion();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
