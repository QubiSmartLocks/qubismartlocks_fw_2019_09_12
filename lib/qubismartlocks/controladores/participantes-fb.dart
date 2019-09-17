/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Participantes -> Participante
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class ParticipantesFB {

  static fb.DatabaseReference drParticipantes = DEM.db.ref( PARTICIPANTES.ENTIDAD );

  static Future guardarParticipante({Participante participante}) async {

    if (participante.key == '') {
      participante.key = drParticipantes.push().key;
    }
    await drParticipantes.child(participante.key).update(participante.toJson());
  }

  static Future borrarParticipante({Participante participante}) async {
    await drParticipantes.child(participante.key).remove();
  }

  static init() async {
    await drParticipantes.remove();
    await InicializarParticipantes.init();
  }

  static todos(List<Participante> lista) async {
    // Lista de Participantes
    lista.clear();
    drParticipantes.onValue.listen((event) {
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
