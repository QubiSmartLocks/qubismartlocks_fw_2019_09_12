/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Mensajes -> Mensaje
         [Qubi Smart Locks/Mensajería (Chats)] para Firebase Realtime Database

*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as firebase;


class MensajesFB {

  static firebase.DatabaseReference drMensajes = DEM.db.ref( CONVERSACIONES.ENTIDAD );

  static Future guardarMensaje({Mensaje mensaje}) async {
//    final _analytics = FirebaseAnalytics();

    if ((mensaje.key == null) || (mensaje.key == '')) {
      mensaje.key = GuardarFechaHora(mensaje.momento).replaceAll('.', '-').replaceAll(':', '-');
    }
    final _json = mensaje.toJson();
    _json.remove(MENSAJES.CONVERSACION);
    _json.remove(MENSAJES.PARTICIPANTE);
    await drMensajes.child(mensaje.conversacion.key).child( MENSAJES.ENTIDAD ).child(mensaje.key).update(_json);
//    _analytics.logEvent(name:  MENSAJES.ENTIDAD , parameters: mensaje.toJson());
  }

  static Future borrarMensaje({Mensaje mensaje}) async {
//    final _analytics = FirebaseAnalytics();
    await drMensajes.child(mensaje.key).remove();
//    _analytics.logEvent(name:  MENSAJES.ENTIDAD + '_Borrado', parameters: mensaje.toJson());
  }

  static init() async {
    await drMensajes.remove();
//    await InicializarMensajes.init();
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

