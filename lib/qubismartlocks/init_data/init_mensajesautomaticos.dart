/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Mensajes Automáticos -> Inicializar Mensaje Automático
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarMensajesAutomaticos {
  static init() async {
    int i = 1;
    MensajeAutomatico _mensajeAutomatico;

    _mensajeAutomatico = new MensajeAutomatico();
    _mensajeAutomatico.id = i++;
    _mensajeAutomatico.tipoMensaje = '';
    _mensajeAutomatico.mensaje = '';
    // Guarda usando el API
//    await MensajesAutomaticos.guardar(_mensajeAutomatico);
    // Guarda usando Firebase Realtime Database
//    await MensajesAutomaticosFB.guardarMensajeAutomatico(mensajeAutomatico: _mensajeAutomatico);
    DEM.listaMensajesAutomaticos.add(_mensajeAutomatico);

  }
}
