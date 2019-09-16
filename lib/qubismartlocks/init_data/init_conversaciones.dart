/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Conversaciones -> Inicializar Conversación
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarConversaciones {
  static init() async {
    int i = 1;
    Conversacion _conversacion;

    _conversacion = new Conversacion();
    _conversacion.id = i++;
    _conversacion.denomConversacion = '';
    _conversacion.ordenPrioridad = 0;
    _conversacion.fechaCreacion = DateTime.now();
    _conversacion.fechaUltimoMensaje = DateTime.now();
    _conversacion.key = '_${i.toString().padLeft(3,'0')}';
    _conversacion.nota = '';
    // Guarda usando el API
//    await Conversaciones.guardar(_conversacion);
    // Guarda usando Firebase Realtime Database
//    await ConversacionesFB.guardarConversacion(conversacion: _conversacion);
    DEM.listaConversaciones.add(_conversacion);

  }
}
