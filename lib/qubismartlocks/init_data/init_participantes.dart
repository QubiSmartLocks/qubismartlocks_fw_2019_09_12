/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Participantes -> Inicializar Participante
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarParticipantes {
  static init() async {
    int i = 1;
    Participante _participante;

    _participante = new Participante();
    _participante.id = i++;
    _participante.conversacion = DEM.listaConversaciones[0];
    _participante.usuario = 0;
    _participante.nombre = '';
    _participante.key = '_${i.toString().padLeft(3,'0')}';
    _participante.nota = '';
    _participante.keyConversacion = '';
    // Guarda usando el API
//    await Participantes.guardar(_participante);
    // Guarda usando Firebase Realtime Database
//    await ParticipantesFB.guardarParticipante(participante: _participante);
    DEM.listaParticipantes.add(_participante);

  }
}
