/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad EstadosReservaciones -> Estado de Reservación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class EstadosReservacionesFB {

  static fb.DatabaseReference drEstadosReservaciones = DEM.db.ref( ESTADOSRESERVACIONES.ENTIDAD );

  static Future guardarEstadoReservacion({EstadoReservacion estadoReservacion}) async {

    if (estadoReservacion.key == '') {
      estadoReservacion.key = drEstadosReservaciones.push().key;
    }
    await drEstadosReservaciones.child(estadoReservacion.key).update(estadoReservacion.toJson());
  }

  static Future borrarEstadoReservacion({EstadoReservacion estadoReservacion}) async {
    await drEstadosReservaciones.child(estadoReservacion.key).remove();
  }

  static init() async {
    await drEstadosReservaciones.remove();
    await InicializarEstadosReservaciones.init();
  }

  static todos(List<EstadoReservacion> lista) async {
    // Lista de Estados de Reservaciones
    lista.clear();
    drEstadosReservaciones.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = EstadoReservacion();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
