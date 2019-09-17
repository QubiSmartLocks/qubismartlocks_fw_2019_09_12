/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Bookings -> Booking
   [Qubi Smart Locks/Clock PMS (Api Reservaciones)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class BookingsFB {

  static fb.DatabaseReference drBookings = DEM.db.ref( BOOKINGS.ENTIDAD );

  static Future guardarBooking({Booking booking}) async {

    if (booking.key == '') {
      booking.key = drBookings.push().key;
    }
    await drBookings.child(booking.key).update(booking.toJson());
  }

  static Future borrarBooking({Booking booking}) async {
    await drBookings.child(booking.key).remove();
  }

  static init() async {
    await drBookings.remove();
    await InicializarBookings.init();
  }

  static todos(List<Booking> lista) async {
    // Lista de Bookings
    lista.clear();
    drBookings.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = Booking();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
