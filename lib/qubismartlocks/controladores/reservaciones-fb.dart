/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Reservaciones -> Reservación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class ReservacionesFB {

  static fb.DatabaseReference drReservaciones = DEM.db.ref( RESERVACIONES.ENTIDAD );

  static Future guardarReservacion({Reservacion reservacion}) async {

    if (reservacion.key == '') {
      reservacion.key = drReservaciones.push().key;
    }
    await drReservaciones.child(reservacion.key).update(reservacion.toJson());
  }

  static Future borrarReservacion({Reservacion reservacion}) async {
    await drReservaciones.child(reservacion.key).remove();
  }

  static init() async {
    await drReservaciones.remove();
    await InicializarReservaciones.init();
  }

  static todos(List<Reservacion> lista) async {
    // Lista de Reservaciones
    lista.clear();
    drReservaciones.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Reservacion();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
