/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Mensajes -> Inicializar Mensaje
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarMensajes {
  static init() async {
    int i = 1;
    Mensaje _mensaje;

    _mensaje = new Mensaje();
    _mensaje.id = i++;
    _mensaje.conversacion = DEM.listaConversaciones[0];
    _mensaje.participante = DEM.listaParticipantes[0];
    _mensaje.momento = new DateTime.now();
    _mensaje.mensajeTexto = '';
    _mensaje.key = '_${i.toString().padLeft(3,'0')}';
    _mensaje.keyConversacion = '';
    _mensaje.keyParticipante = '';
    // Guarda usando el API
//    await Mensajes.guardar(_mensaje);
    // Guarda usando Firebase Realtime Database
//    await MensajesFB.guardarMensaje(mensaje: _mensaje);
    DEM.listaMensajes.add(_mensaje);

  }
}
