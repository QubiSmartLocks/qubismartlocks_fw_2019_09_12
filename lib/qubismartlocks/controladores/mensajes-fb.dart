/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Mensajes -> Mensaje
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class MensajesFB {

  static fb.DatabaseReference drMensajes = DEM.db.ref( MENSAJES.ENTIDAD );

  static Future guardarMensaje({Mensaje mensaje}) async {

    if (mensaje.key == '') {
      mensaje.key = drMensajes.push().key;
    }
    await drMensajes.child(mensaje.key).update(mensaje.toJson());
  }

  static Future borrarMensaje({Mensaje mensaje}) async {
    await drMensajes.child(mensaje.key).remove();
  }

  static init() async {
    await drMensajes.remove();
    await InicializarMensajes.init();
  }

  static todos(List<Mensaje> lista) async {
    // Lista de Mensajes
    lista.clear();
    drMensajes.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Mensaje();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
