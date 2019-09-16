/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Opciones de Mensajería -> Inicializar Opción de Mensajería
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarOpcionesMensajeria {
  static init() async {
    int i = 1;
    OpcionMensajeria _opcionMensajeria;

    _opcionMensajeria = new OpcionMensajeria();
    _opcionMensajeria.id = i++;
    _opcionMensajeria.participanteAutomatico = DEM.listaParticipantes[0];
    _opcionMensajeria.bienvenida = DEM.listaMensajesAutomaticos[0];
    _opcionMensajeria.despedida = DEM.listaMensajesAutomaticos[0];
    _opcionMensajeria.paquete = DEM.listaMensajesAutomaticos[0];
    _opcionMensajeria.proximoCheckIn = DEM.listaMensajesAutomaticos[0];
    _opcionMensajeria.proximoCheckOut = DEM.listaMensajesAutomaticos[0];
    // Guarda usando el API
//    await OpcionesMensajeria.guardar(_opcionMensajeria);
    // Guarda usando Firebase Realtime Database
//    await OpcionesMensajeriaFB.guardarOpcionMensajeria(opcionMensajeria: _opcionMensajeria);
    DEM.listaOpcionesMensajeria.add(_opcionMensajeria);

  }
}
