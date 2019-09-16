/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Estados de Reservaciones -> Inicializar Estado de Reservación
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarEstadosReservaciones {
  static init() async {
    int i = 1;
    EstadoReservacion _estadoReservacion;

    _estadoReservacion = new EstadoReservacion();
    _estadoReservacion.id = i++;
    _estadoReservacion.denomEstadoReservacion = '';
    _estadoReservacion.descEstadoReservacion = '';
    _estadoReservacion.visible = false;
    // Guarda usando el API
//    await EstadosReservaciones.guardar(_estadoReservacion);
    // Guarda usando Firebase Realtime Database
//    await EstadosReservacionesFB.guardarEstadoReservacion(estadoReservacion: _estadoReservacion);
    DEM.listaEstadosReservaciones.add(_estadoReservacion);

  }
}
