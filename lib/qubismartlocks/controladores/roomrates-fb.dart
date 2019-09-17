/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad RoomRates -> Room Rate
   [Qubi Smart Locks/Clock PMS (Api Reservaciones)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class RoomRatesFB {

  static fb.DatabaseReference drRoomRates = DEM.db.ref( ROOMRATES.ENTIDAD );

  static Future guardarRoomRate({RoomRate roomRate}) async {

    if (roomRate.key == '') {
      roomRate.key = drRoomRates.push().key;
    }
    await drRoomRates.child(roomRate.key).update(roomRate.toJson());
  }

  static Future borrarRoomRate({RoomRate roomRate}) async {
    await drRoomRates.child(roomRate.key).remove();
  }

  static init() async {
    await drRoomRates.remove();
    await InicializarRoomRates.init();
  }

  static todos(List<RoomRate> lista) async {
    // Lista de Room Rates
    lista.clear();
    drRoomRates.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.val() != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.val();
        _lista.forEach((key, value) {
          final registro = RoomRate();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}
