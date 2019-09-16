/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Reservaciones -> Inicializar Reservación
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarReservaciones {
  static init() async {
    int i = 1;
    Reservacion _reservacion;

    _reservacion = new Reservacion();
    _reservacion.id = i++;
    _reservacion.idEdificacion = DEM.listaEdificaciones[0];
    _reservacion.numeroReservacion = '';
    _reservacion.fechaLlegada = DateTime.now();
    _reservacion.horaLlegada = TimeOfDay.now();
    _reservacion.fechaSalida = DateTime.now();
    _reservacion.horaSalida = TimeOfDay.now();
    _reservacion.tipoUnidadFuncional = DEM.listaTipUnidadesFuncionales[0];
    _reservacion.unidadFuncional = DEM.listaUnidadesFuncionales[0];
    _reservacion.adultos = 0;
    _reservacion.niyos = 0;
    _reservacion.referenciaNumero = '';
    _reservacion.fechaReferencia = DateTime.now();
    _reservacion.garantizada = false;
    _reservacion.estadoReservacion = DEM.listaEstadosReservaciones[0];
    _reservacion.estadoactualizado = '';
    _reservacion.notasHuesped = '';
    _reservacion.notasReservacion = '';
    _reservacion.notasPersonal = '';
    // Guarda usando el API
//    await Reservaciones.guardar(_reservacion);
    // Guarda usando Firebase Realtime Database
//    await ReservacionesFB.guardarReservacion(reservacion: _reservacion);
    DEM.listaReservaciones.add(_reservacion);

  }
}
