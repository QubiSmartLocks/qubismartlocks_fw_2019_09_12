// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Controlador (MVC) de Entidad Participantes para Firebase Realtime Database
//

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as firebase;


class ParticipantesFB {

  static firebase.DatabaseReference drParticipantes = DEM.db.ref( CONVERSACIONES.ENTIDAD );

  static Future guardarParticipante({Participante participante}) async {
//    final _analytics = FirebaseAnalytics();

    if (participante.key == '') {
      participante.key = drParticipantes.push().key;
    }
    final _json = participante.toJson();
    _json.remove(MENSAJES.CONVERSACION);
    await drParticipantes.child(participante.conversacion.key).child(PARTICIPANTES.ENTIDAD).child(participante.key).update(_json);
//    _analytics.logEvent(name:  PARTICIPANTES.ENTIDAD , parameters: participante.toJson());
  }

  static Future borrarParticipante({Participante participante}) async {
//    final _analytics = FirebaseAnalytics();
    await drParticipantes.child(participante.conversacion.key).child(PARTICIPANTES.ENTIDAD).child(participante.key).remove();
//    _analytics.logEvent(name:  PARTICIPANTES.ENTIDAD + '_Borrado', parameters: participante.toJson());
  }

  static init() async {
//    await drParticipantes.remove();
//    await InicializarParticipantes.init();
  }

  static todos(Conversacion conversacion, List<Participante> lista) async {
    // Lista de Participantes
    lista.clear();
    drParticipantes.child(conversacion.key).child(PARTICIPANTES.ENTIDAD).onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Participante();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

